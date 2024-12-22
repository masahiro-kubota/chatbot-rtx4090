
echo "Waiting for LLM server to be ready..."
until curl -s -o /dev/null -w "%{http_code}" http://localhost:11434/v1/chat/completions \
    -H "Content-Type: application/json" \
    -d '{
    "model": "Qwen2-VL-2B-Instruct",
    "messages": [
        {"role": "system", "content": "You are a helpful assistant."},
        {"role": "user", "content": "Hello! What can you do?"}
    ]
    }' | grep -q "200"; do
    echo "Waiting for LLM server..."
    sleep 1
done

echo "LLM server is ready!"
