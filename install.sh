echo "Configure ZSH..."
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh >> zsh_install.sh
sh zsh_install.sh
sed -i s/robbyrussell/ys/g .zshrc
printf "alias vim='nvim'\nalias vi='nvim'" >> /root/.zshrc

echo "Install NeoVim plugins"
nvim +PackerSync

rm install.sh zsh_install.sh
