import subprocess
import sys
import os
import time
from threading import Thread

def run_flask():
    """Run Flask backend"""
    print("🚀 Starting Flask backend on port 5000...")
    # Use the virtual environment Python
    os.system(".venv\\Scripts\\python.exe app.py")

def run_react():
    """Run React frontend"""
    print("🎨 Starting React frontend on port 3000...")
    os.chdir("research-agent")
    os.system("npm start")

def main():
    print("============================================")
    print("    🔍 AI Research Agent - Development Mode")
    print("============================================")
    print()
    
    # Check if .env file exists
    if not os.path.exists('.env'):
        print("❌ Error: .env file not found!")
        print("Please create a .env file with your TAVILY_API_KEY")
        print("Example: TAVILY_API_KEY=your_api_key_here")
        input("Press Enter to exit...")
        return
    
    print("📦 Installing dependencies...")
    
    # Install React dependencies
    try:
        os.chdir("research-agent")
        subprocess.run(["npm", "install"], check=True)
        os.chdir("..")
        print("✅ React dependencies installed")
    except:
        print("❌ Failed to install React dependencies")
        input("Press Enter to exit...")
        return
    
    print()
    print("🚀 Starting both services...")
    print("📡 Backend:  http://localhost:5000")
    print("🎨 Frontend: http://localhost:3000")
    print()
    print("Press Ctrl+C to stop both services")
    print()
    
    # Start both services
    flask_thread = Thread(target=run_flask, daemon=True)
    react_thread = Thread(target=run_react, daemon=True)
    
    flask_thread.start()
    time.sleep(2)  # Give Flask a moment to start
    react_thread.start()
    
    try:
        # Keep main thread alive
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        print("\n🛑 Stopping services...")
        print("✅ Done!")

if __name__ == "__main__":
    main()