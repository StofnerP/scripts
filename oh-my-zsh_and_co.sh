#!/bin/bash

# zsh has to be installed
# apt(brew) install zsh
# chsh -s $(which zsh)

# installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# A cool font has to be installed (FiraCode, Powerline, etc.)

# manually installing powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc

# plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

sed -i 's@plugins=(git)@plugins=(git wd zsh-autosuggestions zsh-completions zsh-syntax-highlighting)@g' ~/.zshrc

# add some aliases
echo -e "alias x="\'"exit"\'"\nalias c="\'"clear"\'"\nalias v="\'"vim"\'"\nalias rmf="\'"rm -rf"\'"\nalias ip="\'"ip -c"\'"\nalias py3="\'"python3"\'"\nalias count="\'"ls | wc -l"\' >> ~/.zshrc

echo "Finished"
