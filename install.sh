echo "Configure LunarVim..."
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

echo "Configure ZSH..."
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh >> zsh_install.sh
sh zsh_install.sh
sed -i s/robbyrussell/ys/g .zshrc

printf "export PATH=\"/opt/conda/bin:/root/.local/bin:\$PATH\"\nalias vim='lvim'\nalias vi='lvim'\n\nexport TERM=xterm-256color" >> /root/.zshrc

service ssh start


rm install.sh zsh_install.sh 
