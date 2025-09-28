@echo off
echo 🚀 Starting AI Research Agent with Docker...
echo.

cd /d "C:\Users\Owner\OneDrive\Desktop\tavily_research_agent_from_scratch\1st_tavily_ai_research_agent"

echo 🛑 Stopping any running containers...
docker-compose down

echo 🔨 Building and starting containers...
docker-compose up --build

echo.
echo 📡 Backend:  http://localhost:5000
echo 🎨 Frontend: http://localhost:3000
echo.
echo Press Ctrl+C to stop all services
pause