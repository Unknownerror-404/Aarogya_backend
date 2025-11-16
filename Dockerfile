FROM rasa/rasa:3.6.20-full

# Install git and git-lfs so LFS model files actually download
USER root
RUN apt-get update && apt-get install -y git git-lfs && git-lfs install

# Set work directory
WORKDIR /app

# Copy repo (LFS pointer files)
COPY . /app

# Pull LFS file contents
RUN git lfs pull

# Install requirements
RUN pip install --no-cache-dir -r requirements.txt || true

EXPOSE 5005

CMD ["rasa", "run", "--enable-api", "--cors", "*", "--port", "5005", "--host", "0.0.0.0"]
