@echo off
echo ============================================
echo     🔍 AI Research Agent - Development Mode
echo ============================================
echo.

cd /d "C:\Users\Owner\OneDrive\Desktop\tavily_research_agent_from_scratch\1st_tavily_ai_research_agent"

echo 🚀 Activating virtual environment and starting services...

call .venv\Scripts\activate.bat
if %ERRORLEVEL% neq 0 (
    echo ❌ Failed to activate virtual environment
    echo Please run: python -m venv .venv
    pause
    exit /b 1
)

echo ✅ Virtual environment activated
echo 🚀 Starting both services...
echo 📡 Backend:  http://localhost:5000
echo 🎨 Frontend: http://localhost:3000
echo.
echo Press Ctrl+C to stop both services
echo.

python run-both.py
pause