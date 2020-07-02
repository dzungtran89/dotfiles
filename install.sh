#!/usr/bin/env sh

## Env variables
export E=/Volumes/ex01

## Symbolic links

# Create a symlink to External Drive to preserve internal drive.
ln -sf $E/Library/Containers/com.docker.docker $HOME/Library/Containers

# zsh

[[ ! -f ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]] || \
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Projects

