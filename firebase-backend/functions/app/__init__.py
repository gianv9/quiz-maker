"""Application factory for Flask quiz app."""

from flask import Flask
import firebase_admin
from firebase_admin import credentials, firestore
import os


def create_app(testing=False, quiz_service=None):
    """Create and configure Flask application."""
    app = Flask(__name__)
    
    # Configure app
    if testing:
        app.config.update({
            'TESTING': True,
            'WTF_CSRF_ENABLED': False,
        })
        # Set environment variable to indicate testing
        os.environ['TESTING'] = 'true'
    
    # Initialize Firebase (only if not already initialized and not testing)
    if not firebase_admin._apps and not testing:
        try:
            firebase_admin.initialize_app()
        except Exception as e:
            if not testing:
                raise e
    elif not firebase_admin._apps and testing:
        # Initialize with mock credentials for testing
        try:
            mock_cred = credentials.Certificate({
                "type": "service_account",
                "project_id": "test-project-id",
                "private_key_id": "test-key-id",
                "private_key": "-----BEGIN PRIVATE KEY-----\ntest-private-key\n-----END PRIVATE KEY-----\n",
                "client_email": "test@test-project-id.iam.gserviceaccount.com",
                "client_id": "test-client-id",
                "auth_uri": "https://accounts.google.com/o/oauth2/auth",
                "token_uri": "https://oauth2.googleapis.com/token"
            })
            firebase_admin.initialize_app(mock_cred, {
                'projectId': 'test-project-id'
            })
        except Exception:
            pass
    
    # Import and register routes
    from app.routes import register_routes
    register_routes(app, quiz_service)
    
    return app