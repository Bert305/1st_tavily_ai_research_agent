@echo off
echo ============================================
echo    🚀 Starting AI Research Agent with Docker
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

echo 📦 Building and starting containers...
docker-compose up --build

echo.
echo 🎉 Application started successfully!
echo 🌐 Frontend: http://localhost:3000
echo 🔧 Backend:  http://localhost:5000
echo.
pause