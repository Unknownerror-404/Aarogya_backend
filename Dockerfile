FROM rasa/rasa:3.6.20-full

WORKDIR /app

# Copy code
COPY . /app

# Create models folder
RUN mkdir -p /app/models

# Download model from GitHub Release
RUN wget -O /app/models/model.tar.gz \
  https://github.com/Unknownerror-404/Aarogya_backend/releases/download/v1.00.00/20251116-212136-tender-chain.tar.gz

RUN pip install --no-cache-dir -r requirements.txt || true

EXPOSE 5005

CMD ["rasa", "run", "--enable-api", "--cors", "*", "--port", "5005", "--host", "0.0.0.0"]
