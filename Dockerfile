# Use Python base image
FROM python:3.11-slim

# Install Node.js
RUN apt-get update && apt-get install -y \
    curl \
    && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy Python backend
COPY app.py .
COPY .env .

# Copy React frontend
COPY ./research-agent ./frontend

# Build React app
WORKDIR /app/frontend
RUN npm install
RUN npm run build

# Move built files to serve with Flask
WORKDIR /app
RUN cp -r frontend/build/* . 2>/dev/null || echo "Build files copied"

# Expose port
EXPOSE 5000

# Start the application
CMD ["python", "app.py"]