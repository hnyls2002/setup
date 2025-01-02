## Dockerfile

[Dockerfile](./Dockerfile)
    
## Docker Build

```bash
docker build -t lsyin_dev:v1 .
```

## Docker Usage

Run the docker in the background (`--itd`), just run the docker (`-it`).

```bash
docker run -itd --shm-size 32g --gpus all \
    -p 2222:22 \
    -v /opt/dlami/nvme/lsyin/docker_home:/home/lsyin \
    --name lsyin lsyin_dev:v1
```

Enter the docker

```bash
docker exec -it lsyin /bin/zsh
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
