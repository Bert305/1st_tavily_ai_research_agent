import { useState, useEffect } from "react";
import "./App.css";

function App() {
  const [question, setQuestion] = useState("");
  const [response, setResponse] = useState(null);
  const [loading, setLoading] = useState(false);
  const [searchHistory, setSearchHistory] = useState([]);

  // Load search history from localStorage on component mount
  useEffect(() => {
    const savedHistory = localStorage.getItem("searchHistory");
    if (savedHistory) {
      setSearchHistory(JSON.parse(savedHistory));
    }
  }, []);

  // Save search history to localStorage whenever it changes
  useEffect(() => {
    localStorage.setItem("searchHistory", JSON.stringify(searchHistory));
  }, [searchHistory]);

  const addToHistory = (query) => {
    if (!query.trim()) return;
    
    // Remove duplicate if exists and add to front
    const updatedHistory = [
      query,
      ...searchHistory.filter(item => item !== query)
    ].slice(0, 10); // Keep only last 10 searches
    
    setSearchHistory(updatedHistory);
  };

  const askResearchAgent = async (queryToUse = null) => {
    const searchQuery = queryToUse || question;
    if (!searchQuery.trim()) return;
    
    setLoading(true);
    setResponse(null);
    
    // If using a query from history, update the input field
    if (queryToUse) {
      setQuestion(queryToUse);
    }
    
    // Add to search history
    addToHistory(searchQuery);
    
    try {
      const res = await fetch("http://localhost:5000/api/research", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ question: searchQuery })
      });

      const data = await res.json();
      setResponse(data);
    } catch (error) {
      setResponse({ error: "Failed to connect to the research agent" });
    } finally {
      setLoading(false);
    }
  };

  const handleKeyPress = (e) => {
    if (e.key === 'Enter' && !loading) {
      askResearchAgent();
    }
  };

  const clearHistory = () => {
    setSearchHistory([]);
    localStorage.removeItem("searchHistory");
  };

  return (
    <div className="app">
      <div className="container">
        <header className="header">
          <h1 className="title">🔍 AI Research Agent</h1>
          <p className="subtitle">Ask me anything and I'll research it for you</p>
        </header>

        <div className="search-section">
          <div className="search-box">
            <input 
              type="text"
              className="search-input"
              placeholder="What would you like to research?"
              value={question} 
              onChange={e => setQuestion(e.target.value)}
              onKeyPress={handleKeyPress}
              disabled={loading}
            />
            <button 
              className={`search-button ${loading ? 'loading' : ''}`}
              onClick={() => askResearchAgent()}
              disabled={loading || !question.trim()}
            >
              {loading ? (
                <div className="spinner"></div>
              ) : (
                <span>🚀 Research</span>
              )}
            </button>
          </div>
        </div>

        {/* Search History Section */}
        {searchHistory.length > 0 && (
          <div className="history-section">
            <div className="history-header">
              <h3 className="history-title">🕒 Recent Searches</h3>
              <button className="clear-history-btn" onClick={clearHistory}>
                Clear All
              </button>
            </div>
            <div className="history-items">
              {searchHistory.map((historyItem, idx) => (
                <button
                  key={idx}
                  className="history-item"
                  onClick={() => askResearchAgent(historyItem)}
                  disabled={loading}
                >
                  <span className="history-icon">🔍</span>
                  <span className="history-text">{historyItem}</span>
                </button>
              ))}
            </div>
          </div>
        )}

        {response && (
          <div className="results-section">
            {response.error ? (
              <div className="error-card">
                <h3>❌ Error</h3>
                <p>{response.error}</p>
              </div>
            ) : (
              <>
                <div className="answer-card">
                  <h2 className="answer-title">📝 Research Summary</h2>
                  <div className="answer-content">
                    {response.answer}
                  </div>
                </div>

                {response.sources && response.sources.length > 0 && (
                  <div className="sources-card">
                    <h3 className="sources-title">📚 Sources ({response.sources.length})</h3>
                    <div className="sources-grid">
                      {response.sources.map((src, idx) => (
                        <div key={idx} className="source-item">
                          <div className="source-header">
                            <a 
                              href={src.url} 
                              target="_blank" 
                              rel="noreferrer"
                              className="source-link"
                            >
                              <span className="source-number">{idx + 1}</span>
                              <span className="source-title">
                                {src.title || 'Untitled Source'}
                              </span>
                              <span className="external-icon">↗</span>
                            </a>
                          </div>
                          {src.content && (
                            <div className="source-preview">
                              {src.content.substring(0, 200)}
                              {src.content.length > 200 && '...'}
                            </div>
                          )}
                        </div>
                      ))}
                    </div>
                  </div>
                )}
              </>
            )}
          </div>
        )}
      </div>
    </div>
  );
}

export default App;

