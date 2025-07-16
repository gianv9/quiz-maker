"""Route handlers for the quiz application."""

from flask import jsonify, request
# from firebase_admin import firestore
from __version__ import __version__
# from app.services import QuizService


def register_routes(app, quiz_service=None):
    """Register all routes with the Flask app."""
    
    def get_quiz_service():
        """Get or create QuizService instance."""
        if quiz_service:
            return quiz_service
        # Only create real service in production
        from app.services import QuizService
        return QuizService()
    
    @app.route('/topics', methods=['GET'])
    def get_topics():
        """Get all available topics."""
        try:
            service = get_quiz_service()
            return jsonify(service.get_all_topics())
        except Exception as e:
            return jsonify({'error': str(e)}), 500

    @app.route('/questions/<topic>/<difficulty>', methods=['GET'])
    def get_questions(topic, difficulty):
        """Get questions for specific topic and difficulty."""
        try:
            count = request.args.get('count', '10')
            limit = min(int(count), 50) if count.isdigit() else 10
            
            service = get_quiz_service()
            questions = service.get_questions_by_topic_and_difficulty(
                topic, difficulty, limit
            )
            return jsonify(questions)
        except Exception as e:
            return jsonify({'error': str(e)}), 500

    @app.route('/submit-score', methods=['POST'])
    def submit_score():
        """Submit quiz score."""
        try:
            data = request.json
            service = get_quiz_service()
            result = service.submit_quiz_score(data)
            return jsonify(result)
        except Exception as e:
            return jsonify({'error': str(e)}), 500

    @app.route('/results', methods=['GET'])
    @app.route('/stats', methods=['GET'])  # Alias for backward compatibility
    def get_results():
        """Get quiz statistics."""
        try:
            service = get_quiz_service()
            stats = service.get_quiz_statistics()
            return jsonify(stats)
        except Exception as e:
            return jsonify({'error': str(e)}), 500

    @app.route('/version')
    def get_version():
        return {"version": __version__, "service": "firebase-backend"}