# pytorch:22.05-py3: pytorch 1.12
# pytorch:21.12-py3: pytorch 1.11
# pytorch:21.02-py3: pytorch 1.8
# pytorch:20.10-py3: pytorch 1.7
FROM nvcr.io/nvidia/pytorch:21.02-py3

LABEL maintainer='smz5505@psu.edu'

ENV TZ="America/New_York"

# Install basic softwares
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata \
    && apt-get install -y software-properties-common \
    && add-apt-repository -y ppa:neovim-ppa/unstable \
    && apt-get update && apt-get install -y neovim zsh tmux openssh-server\
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# Configure ssh
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Configure tmux
RUN cd \
    && git clone https://github.com/gpakosz/.tmux.git \
    && ln -s -f .tmux/.tmux.conf \
    && cp .tmux/.tmux.conf.local . \
    && printf "set -g default-terminal \"xterm-256color\"\nset -ag terminal-overrides \",xterm-256color:RGB\"" >> .tmux.conf.local

# Configure NerdFonts
RUN git clone https://github.com/ronniedroid/getnf.git \
    && cd getnf \
    && ./install.sh

# TODO:
# 1. Configure zsh (ohmyzsh)
COPY install.sh /root/

WORKDIR /root

