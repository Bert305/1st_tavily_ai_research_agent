# 🔍 AI Research Agent

A modern, full-stack AI research agent powered by Tavily API that provides intelligent answers with credible sources. Built with Flask backend and React frontend.

![AI Research Agent](https://img.shields.io/badge/AI-Research%20Agent-blue?style=for-the-badge&logo=openai)
![Python](https://img.shields.io/badge/Python-3.11-blue?style=for-the-badge&logo=python)
![Flask](https://img.shields.io/badge/Flask-3.0.0-green?style=for-the-badge&logo=flask)
![React](https://img.shields.io/badge/React-18-blue?style=for-the-badge&logo=react)

## ✨ Features

- 🤖 **Intelligent Research**: Ask any question and get comprehensive, AI-powered answers
- 📚 **Source Attribution**: Every answer comes with credible sources and references
- 🎨 **Modern UI**: Beautiful, responsive interface with smooth animations
- 🚀 **Real-time Results**: Fast API responses with loading indicators
- 📱 **Mobile Friendly**: Fully responsive design that works on all devices
- 🔒 **Secure**: Environment-based API key management

## 🏗️ Architecture

```
┌─────────────────┐    HTTP/JSON    ┌──────────────────┐    REST API    ┌─────────────────┐
│  React Frontend │ ──────────────► │  Flask Backend   │ ──────────────► │  Tavily API     │
│  (Port 3000)    │ ◄────────────── │  (Port 5000)     │ ◄────────────── │  (Research)     │
└─────────────────┘                 └──────────────────┘                 └─────────────────┘
```

## 🚀 Quick Start

### Prerequisites

- Python 3.11+
- Node.js 16+
- Tavily API Key ([Get one here](https://tavily.com))

### 1. Clone the Repository

```bash
git clone https://github.com/Bert305/1st_tavily_ai_research_agent.git
cd 1st_tavily_ai_research_agent
```

### 2. Backend Setup (Flask)

```bash
# Create and activate virtual environment
python -m venv .venv
.venv\Scripts\Activate.ps1  # Windows PowerShell
# or
source .venv/bin/activate   # Linux/Mac

# Install dependencies
pip install -r requirements.txt

# Configure environment variables
echo "TAVILY_API_KEY=your_tavily_api_key_here" > .env
# Replace 'your_tavily_api_key_here' with your actual Tavily API key
```

### 3. Frontend Setup (React)

```bash
cd research-agent
npm install
```

### 4. Run the Application

**Terminal 1 - Backend:**
```bash
# From project root
python app.py
```

**Terminal 2 - Frontend:**
```bash
# From research-agent directory
cd research-agent
npm start
```

Visit `http://localhost:3000` to use the application! 🎉

## 🐳 Docker Setup (Recommended)

The easiest way to run the entire application is using Docker. This method runs both backend and frontend together with a single command.

### Prerequisites for Docker
- Docker Desktop installed
- Tavily API Key ([Get one here](https://tavily.com))

### Quick Start with Docker

1. **Clone and Navigate:**
```bash
git clone https://github.com/Bert305/1st_tavily_ai_research_agent.git
cd 1st_tavily_ai_research_agent
```

2. **Configure Environment:**
```bash
echo "TAVILY_API_KEY=your_tavily_api_key_here" > .env
# Replace 'your_tavily_api_key_here' with your actual Tavily API key
```

3. **Start Application:**

**Windows:**
```cmd
# Easy start (recommended)
docker-start.bat

# Or manually
docker-compose up --build
```

**Linux/Mac:**
```bash
docker-compose up --build
```

4. **Access Your Application:**
- 🌐 **Frontend**: http://localhost:3000
- 🔧 **Backend API**: http://localhost:5000
- 💚 **Health Check**: http://localhost:5000/health

### Docker Management

**Stop Application:**
```bash
# Windows
docker-stop.bat

# Linux/Mac
docker-compose down
```

**View Logs:**
```bash
# All services
docker-compose logs -f

# Specific service
docker-compose logs -f backend
docker-compose logs -f frontend
```

**Development Mode:**
```bash
# Windows (with live logs)
docker-dev.bat

# Linux/Mac
docker-compose up --build -d
docker-compose logs -f
```

### 🐳 Container Management

Essential Docker commands for managing your AI Research Agent:

| Command | Description |
|---------|-------------|
| `docker-compose down` | **Stop** the app from running using Docker |
| `docker-compose up -d` | **Start** the application using Docker - both frontend & backend |
| `docker-compose build --no-cache` | **Rebuild** Docker image once you make updates to the code |
| `docker-compose logs -f` | **View** your Docker logs in real-time |

**Quick Command Examples:**

```bash
# Stop the application
docker-compose down

# Start the application in detached mode (runs in background)
docker-compose up -d

# Rebuild after making code changes (recommended)
docker-compose build --no-cache
docker-compose up -d

# View logs from all services
docker-compose logs -f

# View logs from specific service
docker-compose logs -f frontend
docker-compose logs -f backend
```

**Complete Workflow:**
```bash
# 1. Stop any running containers
docker-compose down

# 2. Rebuild with your latest changes
docker-compose build --no-cache

# 3. Start in background
docker-compose up -d

# 4. Monitor logs
docker-compose logs -f
```

## 📁 Project Structure

```
1st_tavily_ai_research_agent/
├── app.py                      # Flask backend server
├── requirements.txt            # Python dependencies
├── .env                       # Environment variables (API keys)
├── Dockerfile.backend         # Docker config for Flask backend
├── docker-compose.yml         # Docker orchestration config
├── docker-start.bat           # Windows Docker start script
├── docker-stop.bat            # Windows Docker stop script
├── docker-dev.bat             # Windows Docker dev script
├── README.md                  # Project documentation
└── research-agent/            # React frontend
    ├── Dockerfile.frontend   # Docker config for React frontend
    ├── nginx.conf            # Nginx configuration
    ├── src/
    │   ├── App.js            # Main React component
    │   ├── App.css           # Modern UI styling
    │   └── index.js          # React entry point
    ├── public/
    └── package.json          # Node.js dependencies
```

## 🔧 API Endpoints

### POST `/api/research`

Research any topic and get AI-powered answers with sources.

**Request:**
```json
{
  "question": "What is machine learning?"
}
```

**Response:**
```json
{
  "answer": "Machine learning is a subset of artificial intelligence...",
  "sources": [
    {
      "url": "https://example.com/ml-guide",
      "title": "Complete Guide to Machine Learning",
      "content": "Machine learning involves algorithms..."
    }
  ]
}
```

## 🎨 UI Features

- **Gradient Background**: Beautiful purple-to-blue gradient
- **Search Box**: Pill-shaped input with integrated search button
- **Loading States**: Animated spinner during research
- **Result Cards**: Clean, modern cards for answers and sources
- **Source Preview**: Expandable content snippets from sources
- **Responsive Design**: Works perfectly on mobile, tablet, and desktop
- **Smooth Animations**: Fade-in effects and hover interactions

## 🔑 Environment Variables

Create a `.env` file in the project root:

```env
TAVILY_API_KEY=your_actual_tavily_api_key_here
```

## 📦 Dependencies

### Backend (Python)
- **Flask 3.0.0**: Web framework
- **requests 2.31.0**: HTTP client for API calls
- **python-dotenv 1.0.0**: Environment variable management
- **flask-cors**: Cross-origin resource sharing

### Frontend (React)
- **React 18**: UI framework
- **Modern CSS**: Custom styling with animations

## 🛠️ Development

### Running in Development Mode

Both servers support hot reload for development:

```bash
# Backend (Flask debug mode)
python app.py

# Frontend (React development server)
cd research-agent && npm start
```

### Adding New Features

1. **Backend**: Modify `app.py` to add new endpoints
2. **Frontend**: Update `App.js` and `App.css` for UI changes
3. **API Integration**: Update the Tavily API calls as needed

## 🌐 Deployment

### Backend Deployment Options:
- **Heroku**: Easy Python app deployment
- **AWS Lambda**: Serverless deployment
- **DigitalOcean**: VPS deployment
- **Vercel**: Full-stack deployment

### Frontend Deployment Options:
- **Netlify**: Static site deployment
- **Vercel**: React app deployment
- **GitHub Pages**: Free static hosting

## 📝 Usage Examples

1. **General Knowledge**: "What is quantum computing?"
2. **Current Events**: "Latest developments in AI technology"
3. **Research Topics**: "Climate change impact on polar ice caps"
4. **Technical Questions**: "How does blockchain work?"
5. **Educational Content**: "Explain photosynthesis process"

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Tavily API** for providing excellent research capabilities
- **Flask** for the robust backend framework
- **React** for the modern frontend experience
- **Open Source Community** for the amazing tools and libraries

---

Made with 🔥🔥🔥🔥 by [Bert305](https://github.com/Bert305)

**⭐ Star this repo if you found it helpful!**

test