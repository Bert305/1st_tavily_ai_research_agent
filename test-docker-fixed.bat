@echo off
echo 🔨 Building and Testing Fixed Docker Setup
echo ============================================
echo.

cd /d "C:\Users\Owner\OneDrive\Desktop\tavily_research_agent_from_scratch\1st_tavily_ai_research_agent"

echo 🛑 Stopping any existing containers...
docker-compose down

echo.
echo 🧹 Cleaning up Docker images...
docker system prune -f

echo.
echo 🔨 Building frontend image with verbose output...
docker-compose build frontend

echo.
echo 🔨 Building backend image...
docker-compose build backend

echo.
echo 🚀 Starting services...
docker-compose up

echo.
echo 📡 Backend:  http://localhost:5000
echo 🎨 Frontend: http://localhost:3000
echo.
pause