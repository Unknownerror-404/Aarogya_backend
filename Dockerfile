FROM rasa/rasa:3.6.20-full

WORKDIR /app

# Copy project files including the model
COPY . /app
COPY models ./models

RUN pip install --no-cache-dir -r requirements.txt || true

EXPOSE 5005

CMD ["rasa", "run", "--enable-api", "--cors", "*", "--port", "5005", "--host", "0.0.0.0"]
