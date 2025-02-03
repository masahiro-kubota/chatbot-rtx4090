It runs on a GPU with 24GB of VRAM (e.g., RTX 4090).

It's using Qwen2-VL-7B. If there's any better LLMs, please let me know!

Requirements
- Docker
- NVIDIA Driver
- NVIDIA Container Toolkit


```
$ docker --version
Docker version 27.4.1, build b9d17ea

$ nvidia-smi --version
NVIDIA-SMI version  : 550.127.05
NVML version        : 550.127
DRIVER version      : 550.127.05
CUDA Version        : 12.4

$ nvidia-container-cli --version
cli-version: 1.17.3
lib-version: 1.17.3
build date: 2024-12-04T09:47+00:00
build revision: 16f37fcafcbdaf67525135104d60d98d36688ba9
build compiler: x86_64-linux-gnu-gcc-7 7.5.0
build platform: x86_64
build flags: -D_GNU_SOURCE -D_FORTIFY_SOURCE=2 -DNDEBUG -std=gnu11 -O2 -g -fdata-sections -ffunction-sections -fplan9-extensions -fstack-protector -fno-strict-aliasing -fvisibility=hidden -Wall -Wextra -Wcast-align -Wpointer-arith -Wmissing-prototypes -Wnonnull -Wwrite-strings -Wlogical-op -Wformat=2 -Wmissing-format-attribute -Winit-self -Wshadow -Wstrict-prototypes -Wunreachable-code -Wconversion -Wsign-conversion -Wno-unknown-warning-option -Wno-format-extra-args -Wno-gnu-alignof-expression -Wl,-zrelro -Wl,-znow -Wl,-zdefs -Wl,--gc-sections
```

```
# to start chatbot
./start-chatbot.sh
```

```
# to stop docker containers
docker compose stop
```
If something is wrong, check the docker logs.
```
docker logs <container name>
```


