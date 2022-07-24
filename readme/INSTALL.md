1. Please backup your own config before using this dotfiles
2. There is no boostrap installation, everything is **symlinks**
3. `git clone` the repo, I would call the repo's fullpath as `<path/to/repo>`
4. `cd` to the repo, then `git submodule update --init --recursive`
5. Picking any configs that you would like to try and do the symlinks

zsh
---

1. See [here](https://ohmyz.sh/) to install `oh-my-zsh`
2. Backup your own configs, normally they are in `~/.zsh` and `~/.oh-my-zsh/custom/plugins/`
3. `ln -sf <path/to/repo>/zsh/.zshrc ~/`
4. `ln -sf <path/to/repo>/zsh/a/pure ~/.zsh/pure`
5. `ln -sf <path/to/repo>/zsh/a/fzf-{z,autosuggestions,tab} ~/.oh-my-zsh/custom/plugins/`
6. (Optional) `ln -sf <path/to/repo>/zsh/d ~/.d`

   This dir contains my daily usage scripts

neovim
------

1. Backup your own configs, normally they are in `~/.nvim` and `~/.config/nvim`
2. `ln -sf <path/to/repo>/.config/nvim ~/.config`
3. Start `nvim` and the plugs would be cloned automatically
4. You also need to install `pynvim` and `nodejs` to make the `coc.nvim` working properly,
   run `:checkhealth` inside nvim for more details

vim
---

1. Backup your own configs, normally they are in `~/.vim` and `~/.vimrc`
2. `ln -sf <path/to/repo>/.vimrc ~/`
3. Start `vim` and the plugs would be cloned automatically

tmux
----

1. Backup your own configs, normally they are in `~/.tmux`, `~/.tmux.conf`
2. `mkdir -p ~/.tmux/scripts`
3. `ln -sf <path/to/repo>/tmux/.tmux.conf ~/`
5. `ln -sf <path/to/repo>/tmux/.tmux.conf.min ~/`
6. `ln -sf <path/to/repo>/tmux/resize-adaptable.sh ~/.tmux/scripts`
