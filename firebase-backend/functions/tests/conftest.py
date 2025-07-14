import pytest
import os
from unittest.mock import patch, MagicMock
import firebase_admin
# from firebase_admin import credentials, firestore

# Set testing environment variables
os.environ['FLASK_ENV'] = 'testing'
os.environ['TESTING'] = 'True'

@pytest.fixture(scope='session', autouse=True)
def setup_firebase_app():
    """Initialize Firebase app for testing."""
    # Clear any existing Firebase apps
    try:
        for app in firebase_admin._apps.values():
            firebase_admin.delete_app(app)
        firebase_admin._apps.clear()
    except:
        pass
    
    yield
    
    # Cleanup after all tests
    try:
        for app in firebase_admin._apps.values():
            firebase_admin.delete_app(app)
        firebase_admin._apps.clear()
    except:
        pass

@pytest.fixture
def mock_firestore():
    """Mock Firestore client for testing."""
    with patch('firebase_admin.firestore.client') as mock_client:
        mock_db = MagicMock()
        mock_client.return_value = mock_db
        
        # Setup common mock patterns
        mock_collection = MagicMock()
        mock_db.collection.return_value = mock_collection
        
        mock_doc = MagicMock()
        mock_collection.where.return_value = mock_collection
        mock_collection.limit.return_value = mock_collection
        mock_collection.stream.return_value = []
        mock_collection.add.return_value = (None, mock_doc)
        
        yield mock_db

@pytest.fixture
def app():
    """Create Flask app for testing."""
    from app import create_app
    from app.services import QuizService
    from unittest.mock import MagicMock
    
    # Create a mocked quiz service
    mock_quiz_service = MagicMock(spec=QuizService)
    
    # Setup default return values
    mock_quiz_service.get_all_topics.return_value = []
    mock_quiz_service.get_questions_by_topic_and_difficulty.return_value = []
    mock_quiz_service.submit_quiz_score.return_value = {'status': 'success'}
    mock_quiz_service.get_quiz_statistics.return_value = []
    
    # Create app in testing mode with mocked service
    flask_app = create_app(testing=True, quiz_service=mock_quiz_service)
    
    # Store the mock service in app config for test access
    flask_app.config['mock_quiz_service'] = mock_quiz_service
    
    with flask_app.app_context():
        yield flask_app

@pytest.fixture
def client(app):
    """Create test client."""
    return app.test_client()

@pytest.fixture
def quiz_service():
    """Create QuizService with mocked database."""
    from app.services import QuizService
    mock_db = MagicMock()
    return QuizService(db_client=mock_db), mock_db

@pytest.fixture
def sample_questions():
    """Sample question data for testing."""
    return [
        {
            'id': 'q1',
            'topic': 'python',
            'difficulty': 'easy',
            'question_type': 'single-choice',
            'question_text': 'What is Python?',
            'options': ['A programming language', 'A snake', 'A movie', 'A car'],
            'correct_answers': ['A programming language'],
            'explanation': 'Python is a high-level programming language.',
            'study_references': ['https://python.org']
        },
        {
            'id': 'q2',
            'topic': 'python',
            'difficulty': 'medium',
            'question_type': 'multiple-choice',
            'question_text': 'Which are Python frameworks?',
            'options': ['Django', 'Flask', 'React', 'Angular'],
            'correct_answers': ['Django', 'Flask'],
            'explanation': 'Django and Flask are Python web frameworks.',
            'study_references': ['https://djangoproject.com', 'https://flask.palletsprojects.com']
        }
    ]

@pytest.fixture
def sample_scores():
    """Sample score data for testing."""
    return [
        {
            'topic': 'python',
            'difficulty': 'easy',
            'score': 80,
            'correct_answers': 4,
            'total_questions': 5,
            'created_at': 'mock_timestamp'
        },
        {
            'topic': 'javascript',
            'difficulty': 'medium',
            'score': 60,
            'correct_answers': 3,
            'total_questions': 5,
            'created_at': 'mock_timestamp'
        }
    ]