"""Business logic services for the quiz application."""

from firebase_admin import firestore


class QuizService:
    """Service class for quiz-related business logic."""
    
    def __init__(self, db_client=None):
        """Initialize the quiz service."""
        self.db = db_client or firestore.client()
    
    def get_all_topics(self):
        """Get all available topics."""
        questions_ref = self.db.collection('questions')
        docs = questions_ref.stream()
        topics = set()
        for doc in docs:
            data = doc.to_dict()
            if 'topic' in data:
                topics.add(data['topic'])
        return list(topics)
    
    def get_questions_by_topic_and_difficulty(self, topic, difficulty, limit=10):
        """Get questions for specific topic and difficulty."""
        questions_ref = self.db.collection('questions')
        
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
        
        return questions
    
    def calculate_score(self, question_type, correct_answers, user_answers, difficulty):
        """Calculate score with penalty for wrong selections."""
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
    
    def submit_quiz_score(self, data):
        """Submit quiz score."""
        if 'detailed_results' in data:
            total_score = 0
            correct_count = 0
            
            for result in data['detailed_results']:
                question_score = self.calculate_score(
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

        self.db.collection('scores').add({
            'topic': data['topic'],
            'difficulty': data['difficulty'],
            'score': data['score'],
            'correct_answers': data['correct'],
            'total_questions': data['total'],
            'created_at': firestore.SERVER_TIMESTAMP
        })
        return {'status': 'success'}
    
    def get_quiz_statistics(self):
        """Get quiz statistics."""
        scores_ref = self.db.collection('scores')
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

        return formatted_stats