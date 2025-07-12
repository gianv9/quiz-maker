"""Basic tests to verify pytest setup is working with refactored code."""

def test_app_factory_creates_app():
    """Test that the app factory creates a Flask app with mocked service."""
    from app import create_app
    from app.services import QuizService
    from unittest.mock import MagicMock
    
    # Create a mocked quiz service
    mock_quiz_service = MagicMock(spec=QuizService)
    
    app = create_app(testing=True, quiz_service=mock_quiz_service)
    assert app is not None
    assert app.config['TESTING'] is True

def test_fixtures_available(app, client, mock_firestore):
    """Test that all basic fixtures are available and working."""
    # Test app fixture
    assert app is not None
    assert app.config['TESTING'] is True
    
    # Test client fixture
    assert client is not None
    
    # Test mock_firestore fixture
    assert mock_firestore is not None
    
    # Test that mock_firestore is properly mocked
    collection = mock_firestore.collection('test')
    assert collection is not None
    
    # Test that app has the mock service
    assert hasattr(app, 'mock_quiz_service')

def test_flask_app_responds(client):
    """Test that Flask app can handle basic requests with mocked services."""
    # Test the root endpoint that returns topics
    response = client.get('/')
    
    # Should get a successful response with empty topics list
    assert response.status_code == 200
    data = response.get_json()
    assert isinstance(data, list)  # Should return a list of topics

def test_sample_data_fixtures(sample_questions, sample_scores):
    """Test that sample data fixtures are working."""
    assert len(sample_questions) == 2
    assert sample_questions[0]['topic'] == 'python'
    
    assert len(sample_scores) == 2
    assert sample_scores[0]['score'] == 80

def test_quiz_service_fixture(quiz_service):
    """Test that quiz service fixture is working."""
    service, mock_db = quiz_service
    assert service is not None
    assert mock_db is not None
    
    # Test that the service has a db client
    assert service.db == mock_db

def test_app_factory_production_mode():
    """Test app factory in production mode (non-testing)."""
    from app import create_app
    from app.services import QuizService
    from unittest.mock import MagicMock
    
    # Create app in production mode with mock service to avoid Firebase init
    mock_quiz_service = MagicMock(spec=QuizService)
    app = create_app(testing=False, quiz_service=mock_quiz_service)
    
    assert app is not None
    assert app.config.get('TESTING') != True  # Should not be in testing mode