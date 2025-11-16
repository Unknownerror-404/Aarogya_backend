# Use official Rasa image (includes Python, TensorFlow, etc.)
FROM rasa/rasa:3.6.20-full

# Set working directory
WORKDIR /app

# Copy all project files
COPY . /app
COPY models /models
# Install additional requirements if any
RUN pip install --no-cache-dir -r requirements.txt || true

# Expose port (Railway will map this automatically)
EXPOSE 5005

# Start Rasa API server
CMD ["rasa", "run", "--enable-api", "--cors", "*", "--port", "5005", "--host", "0.0.0.0"]
