# Use official Rasa image (includes Python, TensorFlow, etc.)
FROM rasa/rasa:3.6.20-full

# Set working directory
WORKDIR /app

# Copy all project files
COPY . /app

# Install additional requirements if any
RUN pip install --no-cache-dir -r requirements.txt || true

# Expose port (Railway will map this automatically)
EXPOSE 5005

# Start Rasa API server
CMD ["/bin/sh", "-c", "rasa run --enable-api --cors '*' --port $PORT"]
