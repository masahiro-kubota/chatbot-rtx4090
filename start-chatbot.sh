#!/bin/bash

docker compose stop
docker compose up -d

echo "Waiting for LLM server to be ready..."
SECONDS=0
until curl -s -o /dev/null -w "%{http_code}" http://localhost:11434/v1/chat/completions \
    -H "Content-Type: application/json" \
    -d '{
    "model": "Qwen2-VL-7B-Instruct",
    "messages": [
        {"role": "system", "content": "You are a helpful assistant."},
        {"role": "user", "content": "Hello! What can you do?"}
    ]
    }' | grep -q "200"; do
    echo "Loading LLM... Elapsed time: ${SECONDS}s"
    sleep 1
done

echo "LLM server is ready!"

echo "Waiting for WebUI to be ready..."
until curl -s http://localhost:3000/api/health > /dev/null; do
    echo "Waiting for WebUI... Elapsed time: ${SECONDS}"
    sleep 1
done

echo "WebUI is ready!"

xdg-open http://localhost:3000 > /dev/null 2>&1 &
