# pytorch:22.05-py3: pytorch 1.12
# pytorch:21.12-py3: pytorch 1.11
# pytorch:21.02-py3: pytorch 1.8
# pytorch:20.10-py3: pytorch 1.7
FROM nvcr.io/nvidia/pytorch:20.10-py3

LABEL maintainer='smz5505@psu.edu'

ENV TZ="America/New_York"

# Install basic softwares
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata \
    && apt-get install -y software-properties-common \
    && add-apt-repository -y ppa:neovim-ppa/unstable \
    && apt-get update && apt-get install -y neovim zsh tmux \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Install node.js
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get install -y nodejs

# Configure tmux
RUN cd \
    && git clone https://github.com/gpakosz/.tmux.git \
    && ln -s -f .tmux/.tmux.conf \
    && cp .tmux/.tmux.conf.local . \
    && printf "set -g default-terminal \"xterm-256color\"\nset -ag terminal-overrides \",xterm-256color:RGB\"" >> .tmux.conf.local

# Configure neovim
RUN mkdir -p /root/.config \
    && printf "alias vim='nvim'\nalias vi='nvim'\n\nexport TERM=xterm-256color" >> /root/.bashrc
RUN curl -L -o ripgrep.deb https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb \
    && dpkg -i ripgrep.deb
RUN curl -L -o fd.deb https://github.com/sharkdp/fd/releases/download/v8.4.0/fd_8.4.0_amd64.deb \
    && dpkg -i fd.deb
COPY nvim /root/.config/nvim
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim 
RUN pip install black isort neovim

# TODO:
# 1. Configure zsh (ohmyzsh)
COPY install.sh /root/

WORKDIR /root

