ARG CUDA_VERSION=12.1.1
FROM nvidia/cuda:${CUDA_VERSION}-devel-ubuntu20.04
ARG BUILD_TYPE=all
ENV DEBIAN_FRONTEND=noninteractive

RUN echo 'tzdata tzdata/Areas select America' | debconf-set-selections \
    && echo 'tzdata tzdata/Zones/America select Los_Angeles' | debconf-set-selections \
    && apt update -y \
    && apt install software-properties-common -y \
    && add-apt-repository ppa:deadsnakes/ppa -y && apt update \
    && apt install python3.10 python3.10-dev -y \
    && update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1 && update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 2 \
    && update-alternatives --set python3 /usr/bin/python3.10 && apt install python3.10-distutils -y \
    && apt install curl git sudo libibverbs-dev -y \
    && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py \
    && python3 --version \
    && python3 -m pip --version

RUN apt update -y \
    && apt install python3.11 python3.11-dev python3.11-full -y \
    && apt install python-is-python3 -y \
    && apt install zsh -y \
    && apt install vim -y \
    && apt install neovim -y \
    && apt install virtualenv wget -y \
    && rm -rf /var/lib/apt/lists/* \
    && apt clean \
    && apt autoremove -y

RUN useradd -m lsyin \
    && echo "lsyin:lsyin" | chpasswd \
    && usermod -aG sudo lsyin \
    && chsh -s /usr/bin/zsh lsyin

USER lsyin
WORKDIR /home/lsyin