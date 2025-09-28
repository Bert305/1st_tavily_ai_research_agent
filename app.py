from flask import Flask, request, jsonify
import requests
import os
from flask_cors import CORS
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

app = Flask(__name__)
CORS(app)

TAVILY_API_KEY = os.getenv("TAVILY_API_KEY")

@app.route("/health", methods=["GET"])
def health_check():
    """Health check endpoint for Docker"""
    return jsonify({"status": "healthy", "service": "AI Research Agent Backend"}), 200

@app.route("/api/research", methods=["POST"])
def research():
    data = request.get_json()
    question = data.get("question")

    response = requests.post(
        "https://api.tavily.com/search",
        headers={"Authorization": f"Bearer {TAVILY_API_KEY}"},
        json={"query": question, "include_answer": True}
    )

    if response.status_code != 200:
        return jsonify({"error": "Tavily API error"}), 500

    result = response.json()
    
    # Debug: Let's see what the API actually returns
    print("Tavily API Response:", result)
    
    # Extract sources and format them properly
    sources = result.get("results", [])
    formatted_sources = []
    
    for source in sources:
        formatted_sources.append({
            "url": source.get("url", ""),
            "title": source.get("title", ""),
            "content": source.get("content", "")
        })
    
    return jsonify({
        "answer": result.get("answer"),
        "sources": formatted_sources
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
