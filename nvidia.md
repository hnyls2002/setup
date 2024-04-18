## Nvidia Tools Setup

### Reference

- [How to Install CUDA on Ubuntu 22.04 | Step-by-Step](https://www.cherryservers.com/blog/install-cuda-ubuntu)
- [CUDA Downloads](https://developer.nvidia.com/cuda-downloads)
- [Post Installation Actions](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#post-installation-actions)

### Nvidia Driver Installation

1. Update Ubuntu

```sh
sudo apt update
sudo apt upgrade 
```

2. List the recommended NVIDIA drivers

```sh
sudo apt install ubuntu-drivers-common
sudo ubuntu-drivers devices
```

Catch the recommended version:

```
driver   : nvidia-driver-535 - distro non-free recommended
```

3. Install the driver `nvidia-driver-xxx`

```sh
sudo apt install nvidia-driver-535
```

4. Reboot and check the driver

```sh
sudo reboot now
nvidia-smi
```

### CUDA Installation

1. Check the [tutorial](https://developer.nvidia.com/cuda-downloads)

```sh
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update
sudo apt-get -y install cuda
```

2. Reboot

```sh
sudo reboot now
```

3. Post Installation Actions

```sh
export PATH=/usr/local/cuda-12.4/bin${PATH:+:${PATH}}
```

4. Check the installation

```sh
nvcc --version
```