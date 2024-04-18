## Install Specific Python Version

### Reference

- [How to Install Python 3.11 on Ubuntu 22.04 or 20.04](https://www.linuxcapable.com/how-to-install-python-3-11-on-ubuntu-linux/)

### Installation

1. Add the deadsnakes PPA repository

```sh
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
```

2. Install Python 3.11

```sh
sudo apt install python3.11
```

3. Install Some Extras

```sh
sudo apt install python3.11-dev
```

or install all the extras

```sh
sudo apt install python3.11-full
```

### Solution for Broken Pip

```sh
curl -sS https://bootstrap.pypa.io/get-pip.py | python3.11
```