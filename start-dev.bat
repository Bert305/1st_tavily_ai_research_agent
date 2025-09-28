@echo off
echo ============================================
echo    🔍 AI Research Agent - Development Mode
echo ============================================
echo.

REM Check if .env file exists
if not exist ".env" (
    echo ❌ Error: .env file not found!
    echo Please create a .env file with your TAVILY_API_KEY
    echo Example: TAVILY_API_KEY=your_api_key_here
    pause
    exit /b 1
)

echo 📦 Installing React dependencies...
cd research-agent
npm install
if errorlevel 1 (
    echo ❌ Failed to install React dependencies
    pause
    exit /b 1
)
cd ..

echo.
echo 🚀 Starting development servers...
echo.
echo 📡 Backend will run on:  http://localhost:5000
echo 🎨 Frontend will run on: http://localhost:3000
echo.
echo Open http://localhost:3000 in your browser
echo Press Ctrl+C to stop both services
echo.

python run-both.py

echo.
echo ✅ Services stopped
pause