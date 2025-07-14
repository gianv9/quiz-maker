"""Tests for API routes/endpoints."""

import json
from __version__ import __version__


class TestQuizRoutes:
    """Test the API endpoints that your frontend will call."""

    def test_get_topics_endpoint(self, client, app):
        """Test GET / endpoint returns topics."""
        # Setup what the mock service should return
        app.mock_quiz_service.get_all_topics.return_value = ['python', 'javascript']
        
        # Make the API call
        response = client.get('/topics')
        
        # Check the response
        assert response.status_code == 200
        data = response.get_json()
        assert data == ['python', 'javascript']
        
        # Verify the service was called
        app.mock_quiz_service.get_all_topics.assert_called_once()

    def test_get_questions_endpoint(self, client, app):
        """Test GET /questions/<topic>/<difficulty> endpoint."""
        # Setup mock response
        mock_questions = [
            {
                'id': 'q1',
                'question': 'What is Python?',
                'question_type': 'single-choice',
                'answers': ['A language', 'A snake'],
                'correct_answers': ['A language'],
                'explanation': 'Python is a programming language',
                'references': []
            }
        ]
        app.mock_quiz_service.get_questions_by_topic_and_difficulty.return_value = mock_questions
        
        # Make the API call
        response = client.get('/questions/python/easy')
        
        # Check the response
        assert response.status_code == 200
        data = response.get_json()
        assert len(data) == 1
        assert data[0]['question'] == 'What is Python?'
        
        # Verify the service was called with correct parameters
        app.mock_quiz_service.get_questions_by_topic_and_difficulty.assert_called_once_with(
            'python', 'easy', 10  # default limit is 10
        )

    def test_get_questions_with_custom_count(self, client, app):
        """Test questions endpoint with custom count parameter."""
        app.mock_quiz_service.get_questions_by_topic_and_difficulty.return_value = []
        
        # Make API call with count parameter
        response = client.get('/questions/python/easy?count=5')
        
        assert response.status_code == 200
        
        # Verify service was called with custom limit
        app.mock_quiz_service.get_questions_by_topic_and_difficulty.assert_called_once_with(
            'python', 'easy', 5
        )

    def test_submit_score_endpoint(self, client, app):
        """Test POST /submit-score endpoint."""
        # Setup mock response
        app.mock_quiz_service.submit_quiz_score.return_value = {'status': 'success'}
        
        # Prepare score data
        score_data = {
            'topic': 'python',
            'difficulty': 'easy',
            'score': 80,
            'correct': 4,
            'total': 5
        }
        
        # Make the API call
        response = client.post('/submit-score', 
                             data=json.dumps(score_data),
                             content_type='application/json')
        
        # Check the response
        assert response.status_code == 200
        data = response.get_json()
        assert data == {'status': 'success'}
        
        # Verify the service was called with the score data
        app.mock_quiz_service.submit_quiz_score.assert_called_once_with(score_data)

    def test_get_results_endpoint(self, client, app):
        """Test GET /results endpoint."""
        # Setup mock response
        mock_stats = [
            {
                'topic': 'python',
                'difficulty': 'easy',
                'avg_score': 75.0,
                'avg_percentage': 0.75,
                'attempts': 10
            }
        ]
        app.mock_quiz_service.get_quiz_statistics.return_value = mock_stats
        
        # Make the API call
        response = client.get('/results')
        
        # Check the response
        assert response.status_code == 200
        data = response.get_json()
        assert len(data) == 1
        assert data[0]['topic'] == 'python'
        assert data[0]['avg_score'] == 75.0
        
        # Verify the service was called
        app.mock_quiz_service.get_quiz_statistics.assert_called_once()

    def test_endpoints_handle_service_errors(self, client, app):
        """Test that endpoints return errors when service fails."""
        # Make the service throw an error
        app.mock_quiz_service.get_all_topics.side_effect = Exception("Database error")
        
        # Make the API call
        response = client.get('/topics')
        
        # Should return 500 error
        assert response.status_code == 500
        data = response.get_json()
        assert 'error' in data
        assert 'Database error' in data['error']

    def test_submit_score_with_invalid_json(self, client, app):
        """Test submitting invalid JSON data."""
        # Send invalid JSON
        response = client.post('/submit-score', 
                             data='invalid json',
                             content_type='application/json')
        
        # Should return error (exact error depends on Flask version)
        assert response.status_code in [400, 500]

    def test_get_stats_endpoint_alias(self, client, app):
        """Test GET /stats endpoint (alias for /results)."""
        # Setup mock response
        mock_stats = [
            {
                'topic': 'python',
                'difficulty': 'easy',
                'avg_score': 75.0,
                'avg_percentage': 0.75,
                'attempts': 10
            }
        ]
        app.mock_quiz_service.get_quiz_statistics.return_value = mock_stats
        
        # Test both endpoints return the same data
        response1 = client.get('/results')
        response2 = client.get('/stats')
        
        assert response1.status_code == 200
        assert response2.status_code == 200
        assert response1.get_json() == response2.get_json()

    def test_version_endpoint(self, client, app):
        """Test the version endpoint returns correct data."""
        with app.test_client() as client:
            response = client.get('/version')
            
            assert response.status_code == 200
            data = response.get_json()
            assert 'version' in data
            assert 'service' in data
            assert data['version'] == __version__
            assert data['service'] == 'firebase-backend'