"""Firebase Functions entry point for the quiz application."""

from firebase_functions import https_fn
from firebase_functions.options import set_global_options
from app import create_app

set_global_options(max_instances=10)

# Create the Flask app using the application factory
app = create_app()

@https_fn.on_request()
def api(req: https_fn.Request) -> https_fn.Response:
    """Firebase Functions entry point."""
    with app.request_context(req.environ):
        return app.full_dispatch_request()