#!/usr/bin/env python3
"""
Simple HTTP server for testing the Emotion Recognition Frontend
Run this script and open http://localhost:8000/login.html in your browser
"""

import http.server
import socketserver
import webbrowser
import os
import sys

# Configuration
PORT = 8000
HOST = "localhost"

class CustomHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    """Custom handler to serve files with correct MIME types"""
    
    def end_headers(self):
        # Add CORS headers for local development
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS')
        self.send_header('Access-Control-Allow-Headers', 'Content-Type')
        super().end_headers()
    
    def guess_type(self, path):
        """Override to ensure correct MIME types"""
        mimetype = super().guess_type(path)
        
        # Fix common MIME type issues
        if path.endswith('.js'):
            return 'application/javascript'
        elif path.endswith('.css'):
            return 'text/css'
        elif path.endswith('.html'):
            return 'text/html'
        elif path.endswith('.json'):
            return 'application/json'
        
        return mimetype

def main():
    # Change to the script's directory
    os.chdir(os.path.dirname(os.path.abspath(__file__)))
    
    # Create server
    with socketserver.TCPServer((HOST, PORT), CustomHTTPRequestHandler) as httpd:
        server_url = f"http://{HOST}:{PORT}"
        login_url = f"{server_url}/login.html"
        
        print("=" * 60)
        print("🎭 EMOTION RECOGNITION FRONTEND SERVER")
        print("=" * 60)
        print(f"📍 Server Address: {server_url}")
        print(f"🔐 Login Page: {login_url}")
        print(f"📂 Serving files from: {os.getcwd()}")
        print()
        print("Demo Credentials:")
        print("  • Username: user     | Password: password")
        print("  • Username: demo     | Password: demo")
        print("  • Username: patient1 | Password: therapy123")
        print("  • Username: admin    | Password: admin123")
        print()
        print("📝 Features to test:")
        print("  1. Login with demo credentials")
        print("  2. Navigate between sections (Profiling, Prediction, History)")
        print("  3. Upload audio files (any MP3/WAV/M4A under 10MB)")
        print("  4. View emotion analysis results with charts")
        print("  5. Check session history and filtering")
        print()
        print("Press Ctrl+C to stop the server")
        print("=" * 60)
        
        # Auto-open browser (optional)
        try:
            auto_open = input("Open browser automatically? (y/N): ").lower().strip()
            if auto_open in ['y', 'yes']:
                webbrowser.open(login_url)
        except (EOFError, KeyboardInterrupt):
            print("\nStarting server without opening browser...")
        
        # Start server
        try:
            print(f"\n🚀 Server started on {server_url}")
            httpd.serve_forever()
        except KeyboardInterrupt:
            print("\n\n👋 Server stopped. Thank you for testing!")
            sys.exit(0)
        except Exception as e:
            print(f"\n❌ Error starting server: {e}")
            sys.exit(1)

if __name__ == "__main__":
    main()
