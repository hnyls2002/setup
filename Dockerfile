
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
    && python3 -m pip --version \
    && rm -rf /var/lib/apt/lists/* \
    && apt clean

RUN apt update -y \
    && apt install python-is-python3 -y \
    && apt install zsh -y \
    && apt install vim neovim virtualenv wget -y

RUN useradd -m lsyin \
    && echo "lsyin:lsyin" | chpasswd \
    && usermod -aG sudo lsyin \
    && chsh -s /usr/bin/zsh lsyin

RUN su - lsyin -c "curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sh -s -- --unattended" \
    && su - lsyin -c "git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" \
    && su - lsyin -c "git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search" \
    && su - lsyin -c "git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-vi-mode" \
    && su - lsyin -c "git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting" \
    && su - lsyin -c 'sed -i "/^plugins=(git)/a \
plugins+=(zsh-autosuggestions)\n\
plugins+=(fast-syntax-highlighting)\n\
plugins+=(zsh-history-substring-search)\n\
plugins+=(zsh-vi-mode)\n\
source \${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh\n\
source \${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh\n\
export ZVM_VI_INSERT_ESCAPE_BINDKEY=jk\n\
bindkey -M vicmd '\''k'\'' history-substring-search-up\n\
bindkey -M vicmd '\''j'\'' history-substring-search-down" ~/.zshrc'

USER lsyin
WORKDIR /home/lsyin