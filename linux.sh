#!/usr/bin/env sh

sudo apt-get install zsh git tmux
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh

# change default shell in case zsh is not automatically changed
chsh

# git clone https://github.com/pyenv/pyenv.git ~/.pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
# fi

# sudo apt install libffi-dev
# sudo apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
# libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
# xz-utils tk-dev libffi-dev liblzma-dev python-openssl git

# https://github.com/pyenv/pyenv/wiki/common-build-problems#prerequisites
sudo apt install kitty neovim git gcc zsh

# zsh
ln -sf $HOME/code/github/dotfiles/zsh/.linux_profile ~/.sh_profile
ln -sf $HOME/code/github/dotfiles/zsh/.sh_aliases ~/

cp ~/.zshrc ~/.zshrc.bk
ln -sf $HOME/code/github/dotfiles/zsh/.zshrc ~/

git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

# python
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1

# tmux
ln -sf $HOME/code/github/dotfiles/tmux/plugins/.tmux/.tmux.conf ~/
ln -sf $HOME/code/github/dotfiles/tmux/.tmux.conf.local ~/

# kitty
ln -sf $HOME/code/github/dotfiles/kitty/kitty.conf ~/.config/kitty

# nvim
ln -sf ~/code/github/dotfiles/nvim ~/.config/

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
nvm install nodejs npm

# Adding apt repos
ADD_REPO='sudo add-apt-repository -y'
$ADD_REPO ppa:noobslab/icons
$ADD_REPO ppa:agornostal/ulauncher
$ADD_REPO ppa:bamboo-engine/ibus-bamboo
$ADD_REPO ppa:lazygit-team/release

sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# Updating apt
sudo apt update

# Doing installation
sudo apt install fzf python3-pip ruby universal-ctags ttf-mscorefonts-installer \
    neovim emacs kitty code tig fd-find locate neofetch \
    firejail htop lazygit docker-ce docker-ce-cli \
    containerd.io postgresql libpq-dev \
    ibus-bamboo steam \
    obs-studio blender brave-browser \
    telegram-desktop ulauncher

curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

# post install
ln -s $(which fdfind) ~/.local/bin/fd
ibus restart
gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'Bamboo')]"

