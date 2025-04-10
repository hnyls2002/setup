## Dockerfile

~~[Dockerfile](./Dockerfile)~~
    
## Docker Build

```bash
docker build -t lsyin_dev:v1 .
```

## Docker Usage

Run the docker in the background (`--itd`), just run the docker (`-it`).

```bash
docker run -itd --shm-size 128g \
    --gpus all \
    -p 8022:22 \
    -v /path/of/host:/path/in/docker \
    -w /entry/path \
    --name lsyin docker_image_name
```

Enter the docker

```bash
docker exec -it lsyin zsh
```

List all the docker containers

```bash 
docker ps -a
```

Stop the docker

```bash
docker stop lsyin
```

Remove the docker

```bash
docker rm lsyin
```
