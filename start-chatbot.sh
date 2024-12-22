#!/bin/bash

docker compose down

docker compose up -d

echo "Waiting for Ollama server to be ready..."
until curl -s http://localhost:11434/api/tags > /dev/null; do
    echo "Waiting for Ollama API..."
    sleep 1
done

echo "Ollama server is ready!"

if docker exec ollama ollama list | grep -q "7shi/tanuki-dpo-v1.0:8b-q6_K"; then
    echo "Model already exists, starting it..."
else
    echo "Downloading model..."
    docker exec -it ollama ollama pull 7shi/tanuki-dpo-v1.0:8b-q6_K
fi

echo "Waiting for WebUI to be ready..."
until curl -s http://localhost:3000/api/health > /dev/null; do
    echo "Waiting for WebUI..."
    sleep 1
done

echo "WebUI is ready!"

xdg-open http://localhost:3000 > /dev/null 2>&1 &
