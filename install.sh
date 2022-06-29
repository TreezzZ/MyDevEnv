echo "Install node.js..."
curl -sL install-node.vercel.app/lts | bash

echo "Configure ZSH..."
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh >> zsh_install.sh
sh zsh_install.sh
sed -i s/robbyrussell/ys/g .zshrc

rm install.sh zsh_install.sh

echo "Next: input :PlugInstall and :CocInstall coc-json coc-tsserver in VIM"
