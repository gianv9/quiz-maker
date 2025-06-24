# File structure:
# aws-game/
# ├── app.py
# ├── requirements.txt
# ├── docker-compose.yml
# ├── Dockerfile
# ├── init.sql
# └── templates/
#     ├── index.html
#     ├── game.html
#     └── results.html

# =============================================================================
# app.py - Main Flask Application
# =============================================================================

from flask import Flask, render_template, request, jsonify, session
import psycopg2
import psycopg2.extras
import os
from datetime import datetime
import random

app = Flask(__name__)
app.secret_key = os.environ.get('SECRET_KEY', 'dev-secret-key')

# Database connection
def get_db():
    return psycopg2.connect(
        host=os.environ.get('DB_HOST', 'db'),
        database=os.environ.get('DB_NAME', 'awsgame'),
        user=os.environ.get('DB_USER', 'postgres'),
        password=os.environ.get('DB_PASSWORD', 'password'),
        cursor_factory=psycopg2.extras.RealDictCursor
    )

@app.route('/')
def index():
    """Main menu page"""
    with get_db() as conn:
        with conn.cursor() as cur:
            cur.execute("SELECT DISTINCT topic FROM questions ORDER BY topic")
            topics = [row['topic'] for row in cur.fetchall()]
    return render_template('index.html', topics=topics)

@app.route('/game/<topic>/<difficulty>')
def game(topic, difficulty):
    """Game page for specific topic and difficulty"""
    return render_template('game.html', topic=topic, difficulty=difficulty)

@app.route('/api/questions/<topic>/<difficulty>')
def get_questions(topic, difficulty):
    """API endpoint to get questions for topic and difficulty"""
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
            'references': q['references'].split('|') if q['references'] else []
        })
    
    return jsonify(formatted_questions)

@app.route('/api/submit-score', methods=['POST'])
def submit_score():
    """Save user score"""
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

@app.route('/results')
def results():
    """Results page with statistics"""
    with get_db() as conn:
        with conn.cursor() as cur:
            cur.execute("""
                SELECT topic, difficulty, AVG(score) as avg_score, 
                       AVG(correct_answers::float/total_questions) as avg_percentage,
                       COUNT(*) as attempts
                FROM scores 
                GROUP BY topic, difficulty 
                ORDER BY topic, difficulty
            """)
            stats = cur.fetchall()
    return render_template('results.html', stats=stats)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)