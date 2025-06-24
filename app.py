from flask import Flask, render_template, request, jsonify, session
import psycopg2
import psycopg2.extras
import os
from datetime import datetime
import random
import time
import sys

app = Flask(__name__)
app.secret_key = os.environ.get('SECRET_KEY', 'dev-secret-key')

def get_db():
    """Database connection with retry logic"""
    max_retries = 10
    retry_delay = 2
    
    for attempt in range(max_retries):
        try:
            conn = psycopg2.connect(
                host=os.environ.get('DB_HOST', 'db'),
                database=os.environ.get('DB_NAME', 'awsgame'),
                user=os.environ.get('DB_USER', 'postgres'),
                password=os.environ.get('DB_PASSWORD', 'password'),
                cursor_factory=psycopg2.extras.RealDictCursor
            )
            print(f"Database connected successfully on attempt {attempt + 1}")
            return conn
        except psycopg2.OperationalError as e:
            if attempt < max_retries - 1:
                print(f"Database connection attempt {attempt + 1} failed, retrying in {retry_delay} seconds...")
                time.sleep(retry_delay)
            else:
                print(f"Failed to connect to database after {max_retries} attempts")
                raise e

@app.route('/')
def index():
    """Main menu page"""
    try:
        with get_db() as conn:
            with conn.cursor() as cur:
                cur.execute("SELECT DISTINCT topic FROM questions ORDER BY topic")
                topics = [row['topic'] for row in cur.fetchall()]
        return render_template('index.html', topics=topics)
    except Exception as e:
        return f"Database error: {str(e)}", 500

@app.route('/game/<topic>/<difficulty>')
def game(topic, difficulty):
    """Game page for specific topic and difficulty"""
    return render_template('game.html', topic=topic, difficulty=difficulty)

@app.route('/api/questions/<topic>/<difficulty>')
def get_questions(topic, difficulty):
    """API endpoint to get questions for topic and difficulty"""
    try:
        with get_db() as conn:
            with conn.cursor() as cur:
                if topic == 'mixed':
                    cur.execute(
                        "SELECT * FROM questions WHERE difficulty = %s ORDER BY RANDOM() LIMIT 10",
                        (difficulty,)
                    )
                else:
                    cur.execute(
                        "SELECT * FROM questions WHERE topic = %s AND difficulty = %s ORDER BY RANDOM()",
                        (topic, difficulty)
                    )
                questions = cur.fetchall()
        
        # Convert to JSON-friendly format
        formatted_questions = []
        for q in questions:
            formatted_questions.append({
                'id': q['id'],
                'question': q['question_text'],
                'answers': [q['option_a'], q['option_b'], q['option_c'], q['option_d']],
                'correct': q['correct_answer'],
                'explanation': q['explanation'],
                'references': q['study_references'].split('|') if q['study_references'] else []
            })
        
        return jsonify(formatted_questions)
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/api/submit-score', methods=['POST'])
def submit_score():
    """Save user score"""
    try:
        data = request.json
        with get_db() as conn:
            with conn.cursor() as cur:
                cur.execute(
                    """INSERT INTO scores (topic, difficulty, score, correct_answers, total_questions, created_at)
                       VALUES (%s, %s, %s, %s, %s, %s)""",
                    (data['topic'], data['difficulty'], data['score'], 
                     data['correct'], data['total'], datetime.now())
                )
                conn.commit()
        return jsonify({'status': 'success'})
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/results')
def results():
    """Results page with statistics"""
    try:
        with get_db() as conn:
            with conn.cursor() as cur:
                cur.execute("""
                    SELECT topic, difficulty, AVG(score) as avg_score, 
                           AVG(CASE WHEN total_questions > 0 
                               THEN correct_answers::float/total_questions 
                               ELSE 0 END) as avg_percentage,
                           COUNT(*) as attempts
                    FROM scores 
                    WHERE total_questions > 0
                    GROUP BY topic, difficulty 
                    ORDER BY topic, difficulty
                """)
                stats = cur.fetchall()
        return render_template('results.html', stats=stats)
    except Exception as e:
        return f"Database error: {str(e)}", 500

if __name__ == '__main__':
    # Wait for database to be ready on startup
    print("Waiting for database connection...")
    try:
        with get_db() as conn:
            print("Database is ready!")
    except Exception as e:
        print(f"Database startup failed: {e}")
        sys.exit(1)
    
    app.run(host='0.0.0.0', port=5000, debug=True)