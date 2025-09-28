@echo off
echo ============================================
echo    🚀 Quick Start AI Research Agent
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

echo 📦 Building single container (faster)...
docker build -t ai-research-agent .

echo 🚀 Starting application...
docker run -p 5000:5000 --env-file .env --name ai-research-agent --rm ai-research-agent

echo.
echo 🎉 Application started!
echo 🌐 Access: http://localhost:5000
echo.