It runs on a GPU with 24GB of VRAM (e.g., RTX 4090).

It's using Qwen2-VL-7B. If there's any better LLMs, please let me know!
```
# to start chatbot
./start-ollama.sh
```

```
# to stop docker containers
docker compose stop
```
If something is wrong, check the docker logs.
```
docker logs <container name>
```


Requirements
- NVIDIA Container Toolkit
- Docker
