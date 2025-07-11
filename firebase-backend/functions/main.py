# Welcome to Cloud Functions for Firebase for Python!
# To get started, simply uncomment the below code or create your own.
# Deploy with `firebase deploy`

from firebase_functions import https_fn
from firebase_functions.options import set_global_options
from firebase_admin import initialize_app, firestore
from flask import Flask, jsonify, request

set_global_options(max_instances=10)

initialize_app()

db = firestore.client()

app = Flask(__name__)

@app.route('/', methods=['GET'])
def get_topics():
    """Get all available topics"""
    try:
        questions_ref = db.collection('questions')
        docs = questions_ref.stream()
        topics = set()
        for doc in docs:
            data = doc.to_dict()
            if 'topic' in data:
                topics.add(data['topic'])
        return jsonify(list(topics))
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/questions/<topic>/<difficulty>', methods=['GET'])
def get_questions(topic, difficulty):
    """Get questions for specific topic and difficulty"""
    try:
        count = request.args.get('count', '10')
        limit = min(int(count), 50) if count.isdigit() else 10

        questions_ref = db.collection('questions')
        if topic == 'mixed':
            query = questions_ref.where('difficulty', '==', difficulty).limit(limit)
        else:
            query = questions_ref.where('topic', '==', topic).where('difficulty', '==', difficulty).limit(limit)

        docs = query.stream()
        questions = []
        
        for doc in docs:
            data = doc.to_dict()
            questions.append({
                'id': doc.id,
                'question': data.get('question_text', ''),
                'question_type': data.get('question_type', 'single-choice'),
                'answers': data.get('options', []),
                'correct_answers': data.get('correct_answers', []),
                'explanation': data.get('explanation', ''),
                'references': data.get('study_references', [])
            })
        
        return jsonify(questions)
    except Exception as e:
        return jsonify({'error': str(e)}), 500

def calculate_score(question_type, correct_answers, user_answers, difficulty):
    """Calculate score with penalty for wrong selections"""
    base_points = {'easy': 10, 'medium': 20, 'hard': 30}[difficulty]
    
    if question_type == 'single-choice':
        return base_points if user_answers and user_answers[0] in correct_answers else 0
    
    elif question_type == 'multiple-choice':
        if not user_answers:
            return 0
        
        correct_set = set(correct_answers)
        user_set = set(user_answers)
        
        # Calculate correct and wrong selections
        correct_selections = len(correct_set.intersection(user_set))
        wrong_selections = len(user_set - correct_set)
        total_correct = len(correct_set)
        
        # Score = (correct - wrong) / total_correct * max_points, minimum 0
        if total_correct > 0:
            score_ratio = max(0, (correct_selections - wrong_selections) / total_correct)
            return int(base_points * score_ratio)
        
        return 0
    
    return 0

@app.route('/submit-score', methods=['POST'])
def submit_score():
    """Submit quiz score"""
    try:
        data = request.json
        
        if 'detailed_results' in data:
            total_score = 0
            correct_count = 0
            
            for result in data['detailed_results']:
                question_score = calculate_score(
                    result['question_type'],
                    result['correct_answers'], 
                    result['user_answers'],
                    data['difficulty']
                )
                total_score += question_score
                
                base_points = {'easy': 10, 'medium': 20, 'hard': 30}[data['difficulty']]
                if question_score == base_points:
                    correct_count += 1
            
            data['score'] = total_score
            data['correct'] = correct_count

        db.collection('scores').add({
            'topic': data['topic'],
            'difficulty': data['difficulty'],
            'score': data['score'],
            'correct_answers': data['correct'],
            'total_questions': data['total'],
            'created_at': firestore.SERVER_TIMESTAMP
        })
        return jsonify({'status': 'success'})
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/results', methods=['GET'])
def results():
    """Get quiz statistics"""
    try:
        scores_ref = db.collection('scores')
        docs = scores_ref.stream()
        scores = [doc.to_dict() for doc in docs]

        stats = {}
        for score in scores:
            key = (score['topic'], score['difficulty'])
            if key not in stats:
                stats[key] = {'total_score': 0, 'total_correct': 0, 'total_questions': 0, 'attempts': 0}
            
            stats[key]['total_score'] += score['score']
            stats[key]['total_correct'] += score['correct_answers']
            stats[key]['total_questions'] += score['total_questions']
            stats[key]['attempts'] += 1

        formatted_stats = []
        for key, data in stats.items():
            topic, difficulty = key
            avg_score = data['total_score'] / data['attempts']
            avg_percentage = (data['total_correct'] / data['total_questions']) if data['total_questions'] > 0 else 0
            formatted_stats.append({
                'topic': topic,
                'difficulty': difficulty,
                'avg_score': avg_score,
                'avg_percentage': avg_percentage,
                'attempts': data['attempts']
            })

        return jsonify(formatted_stats)
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@https_fn.on_request()
def api(req: https_fn.Request) -> https_fn.Response:
    with app.request_context(req.environ):
        return app.full_dispatch_request()