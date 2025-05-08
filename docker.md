## Dockerfile

~~[Dockerfile](./Dockerfile)~~
    
## Docker Build

```bash
docker build -t lsyin_dev:v1 .
```

## Docker Usage

Run the docker in the background (`--itd`), just run the docker (`-it`).

```bash
docker run -itd \
	--shm-size 128g \
	--gpus all \
	--net=host \
	--privileged \
	-v /dev/infiniband:/dev/infiniband \
	-v /sys/class/infiniband:/sys/class/infiniband \
	--ulimit memlock=-1 \
	-v /home/lsyin/docker-workspace:/sgl-workspace \
	-v /home/lsyin/.ssh:/root/.ssh \
	-v /home/lsyin/.cache:/root/.cache \
	-w /sgl-workspace \
	--name <name> lmsysorg/sglang:dev
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
