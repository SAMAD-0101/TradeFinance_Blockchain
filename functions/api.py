import sys
import os

# Add the backend directory to the Python path
# This allows importing 'app' from the sibling 'backend' directory
current_dir = os.path.dirname(os.path.abspath(__file__))
backend_dir = os.path.join(current_dir, "..", "backend")
sys.path.append(backend_dir)

from app.main import handler

# Netlify expects a function named 'handler' or just the module to expose it
# We already imported 'handler' (Mangum instance) from app.main
