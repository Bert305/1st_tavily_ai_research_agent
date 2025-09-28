@echo off
echo ============================================
echo    🔧 Starting AI Research Agent (Dev Mode)
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

echo 📦 Building and starting containers with live reload...
docker-compose up --build -d

echo.
echo 📊 Container status:
docker-compose ps

echo.
echo 📋 To view logs:
echo    Backend:  docker-compose logs -f backend
echo    Frontend: docker-compose logs -f frontend
echo    All:      docker-compose logs -f
echo.
echo 🎉 Development environment started!
echo 🌐 Frontend: http://localhost:3000
echo 🔧 Backend:  http://localhost:5000
echo 💚 Health:   http://localhost:5000/health
echo.
echo Press any key to view live logs...
pause
docker-compose logs -f