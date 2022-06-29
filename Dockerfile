FROM nvcr.io/nvidia/pytorch:21.12-py3

LABEL maintainer='smz5505@psu.edu'

# Install basic softwares
RUN apt-get update && apt-get install -y neovim zsh tmux \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# Configure tmux
RUN cd \
    && git clone https://github.com/gpakosz/.tmux.git \
    && ln -s -f .tmux/.tmux.conf \
    && cp .tmux/.tmux.conf.local .

# Configure neovim
RUN mkdir -p /root/.config/nvim \
    && pip install neovim \
    && sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
COPY init.vim /root/.config/nvim/
RUN mv /usr/bin/nvim /usr/bin/vim

# TODO:
# 1. Configure zsh (ohmyzsh)
# 2. Install vim plugins (coc.nvim)
COPY install.sh /root/

WORKDIR /root

