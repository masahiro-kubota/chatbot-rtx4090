#!/bin/bash

docker compose up -d

echo "waiting for Ollama server to start..."

sleep 30

docker exec -it ollama ollama run 7shi/tanuki-dpo-v1.0:8b-q6_K
