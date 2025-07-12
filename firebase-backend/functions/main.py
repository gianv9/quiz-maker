# Welcome to Cloud Functions for Firebase for Python!
# To get started, simply uncomment the below code or create your own.
# Deploy with `firebase deploy`

# IMPORTANT: Firebase Functions add the function name to the URL path
# Since our function is named 'api', all routes will be under /api/
# Example: https://region-project.cloudfunctions.net/api/topics
# This matches the Flask API structure where routes are /api/topics, /api/stats, etc.

from firebase_functions import https_fn
from firebase_functions.options import set_global_options
from firebase_admin import initialize_app, firestore
from google.cloud.firestore_v1 import SERVER_TIMESTAMP
from flask import Flask, jsonify, request
from flask_cors import CORS

set_global_options(max_instances=10)

initialize_app()

db = firestore.client()

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

@app.route('/topics', methods=['GET'])
def get_topics():
    """Get all available topics"""
    try:
        questions_ref = db.collection('questions')
        docs = questions_ref.stream()
        topics = set()
        for doc in docs:
            data = doc.to_dict()
            if data and 'topic' in data:
                topics.add(data['topic'])
        return jsonify(list(sorted(topics)))  # Sort for consistency
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/questions/<topic>/<difficulty>', methods=['GET'])
def get_questions(topic, difficulty):
    """Get questions for specific topic and difficulty"""
    try:
        count = request.args.get('count', '10')
        
        # Match Flask behavior for limits
        if count == 'all':
            limit = 50  # Maximum questions per quiz
        else:
            limit = min(int(count), 50) if count.isdigit() else 10

        questions_ref = db.collection('questions')
        
        # Build query
        if topic == 'mixed':
            # For mixed, get random questions from all topics
            query = questions_ref.where('difficulty', '==', difficulty)
        else:
            query = questions_ref.where('topic', '==', topic).where('difficulty', '==', difficulty)
        
        # Get all matching docs then randomly select
        all_docs = list(query.stream())
        
        # Randomly sample if we have more than needed
        import random
        if len(all_docs) > limit:
            selected_docs = random.sample(all_docs, limit)
        else:
            selected_docs = all_docs
            
        questions = []
        
        for doc in selected_docs:
            data = doc.to_dict()
            
            # Skip if document data is None (shouldn't happen, but satisfies linter)
            if data is None:
                continue
            
            # Format to match Flask response structure exactly
            questions.append({
                'id': doc.id,  # Use Firestore document ID
                'question': data.get('question_text', ''),
                'question_type': data.get('question_type', 'single-choice'),
                'answers': data.get('options', ['', '', '', '']),
                'correct_answers': data.get('correct_answers', []),
                'explanation': data.get('explanation', ''),
                'references': data.get('study_references', [])
            })
        
        return jsonify(questions)
    except Exception as e:
        return jsonify({'error': str(e)}), 500

def calculate_score(question_type, correct_answers, user_answers, difficulty):
    """Calculate score with penalty for wrong selections - matches Flask logic"""
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
        
        # Calculate detailed scoring if provided - matches Flask behavior
        if data is not None and 'detailed_results' in data:
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
                
                # Count as correct if full points achieved
                base_points = {'easy': 10, 'medium': 20, 'hard': 30}[data['difficulty']]
                if question_score == base_points:
                    correct_count += 1
            
            # Override with calculated values
            data['score'] = total_score
            data['correct'] = correct_count

        # Store in Firestore
        if data is not None:
            db.collection('scores').add({
                'topic': data.get('topic', ''),
                'difficulty': data.get('difficulty', ''),
                'score': data.get('score', 0),
                'correct_answers': data.get('correct', 0),
                'total_questions': data.get('total_questions', 10), 
                'created_at': SERVER_TIMESTAMP
            })
            return jsonify({'status': 'success'})
        else:
            return jsonify({'error': 'No data provided'}), 400
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/stats', methods=['GET'])
def get_stats():
    """Get quiz statistics"""
    try:
        scores_ref = db.collection('scores')
        docs = scores_ref.stream()
        
        # Aggregate statistics
        stats_dict = {}
        for doc in docs:
            score = doc.to_dict()
            
            # Skip if document data is None
            if score is None:
                continue
            
            # Skip invalid records
            if score.get('total_questions', 0) == 0:
                continue
                
            key = (score['topic'], score['difficulty'])
            
            if key not in stats_dict:
                stats_dict[key] = {
                    'total_score': 0,
                    'total_correct': 0,
                    'total_questions': 0,
                    'attempts': 0
                }
            
            stats_dict[key]['total_score'] += score.get('score', 0)
            stats_dict[key]['total_correct'] += score.get('correct_answers', 0)
            stats_dict[key]['total_questions'] += score.get('total_questions', 0)
            stats_dict[key]['attempts'] += 1

        # Format response to match Flask
        formatted_stats = []
        for (topic, difficulty), data in stats_dict.items():
            if data['attempts'] > 0:
                avg_score = data['total_score'] / data['attempts']
                avg_percentage = data['total_correct'] / data['total_questions'] if data['total_questions'] > 0 else 0
                
                formatted_stats.append({
                    'topic': topic,
                    'difficulty': difficulty,
                    'avg_score': float(avg_score),
                    'avg_percentage': float(avg_percentage),
                    'attempts': int(data['attempts'])
                })
        
        # Sort by topic and difficulty for consistency
        formatted_stats.sort(key=lambda x: (x['topic'], x['difficulty']))
        
        return jsonify(formatted_stats)
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@https_fn.on_request()
def api(req: https_fn.Request) -> https_fn.Response:
    with app.request_context(req.environ):
        return app.full_dispatch_request()