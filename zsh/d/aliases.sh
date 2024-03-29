# vim:ft=sh:fdm=syntax

# Restart SHELL
alias clear='clear; tmux clear-history; clear'
alias ez='pyenv deactivate; typeset -U PATH; clear'

alias p='pwd'
alias diskusage='iostat -Id disk0'
alias fa='alias | grep'

alias pins='pip install -q'
alias cl='clear'
alias cpath='pwd|pbcopy'

alias vim=nvim
alias vin='vi --noplugin'
alias vs='vim -S $@'
alias vno='vim -u NORC $@'

# yabai
alias ycf='yabai -m config $@'

# hugo
alias hs='hugo server'

alias bu='buku'
alias b='bu --suggest'

# docker
alias dki='docker images'
alias dkig='docker images | grep'
alias dkrmi='docker rmi'
alias dkls='docker container ls'
alias dks='docker container start $@'
alias dksp='docker container stop $@'
alias dke='docker exec -it $@'
alias psp='ps aux | grep $1 | grep -Ev grep'
alias dklog='docker login docker-hub.trobz.com:443'
alias dkclean='docker volume rm $(docker volume ls -qf dangling=true)'
alias dkpsex="docker ps -q -f 'status=exited'"

# icloud
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'

# emacs
alias em='emacs'
alias ve='emacsclient -t'
alias vec='ve ~/.emacs.d/init.el'
# alias emd='emacs --daemon'
# alias emk='emacsclient -e "(kill-emacs)"'
# alias emc='emacsclient -c'

# trobz internal tools
alias roi='remoteoi'
alias eoi='emoi --offline'
alias aoi='anhoi'
alias es='clear; eoi start'
alias eu='clear; eoi upgrade'

alias dois='demoi start'

# yabai, skhd
alias yres='launchctl kickstart -k "gui/${UID}/homebrew.mxcl.yabai"'
alias sres='launchctl kickstart -k "gui/${UID}/homebrew.mxcl.skhd"'
alias bres='launchctl kickstart -k "gui/${UID}/homebrew.mxcl.sketchybar"'

# postgres
alias pgup='brew postgresql-upgrade-database'

alias lt='tree -la -L'

if command -v exa &> /dev/null; then
  alias ls='exa'
  alias la='ls -lah'
  unalias lt
  alias lt='ls -T --level $@'
  # alias la='exa -l --all --group-directories-first'
  # alias ll='exa -l --all --all --group-directories-first'
  # alias lg='exa -l --all --group-directories-first --git'
  # alias llg='exa -l --all --all --group-directories-first --git'
  # alias lt='exa -T --git-ignore --group-directories-first --level'
  # alias llt='exa -lT --git-ignore --level=2 --group-directories-first'
  # alias lT='exa -T --git-ignore --level=4 --group-directories-first'
fi

alias lgit='lazygit'
alias ldocker='lazydocker'

# alias fzf="fzf --layout=reverse --height=50% --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'"

# flutter
alias fl='flutter'
alias flb='flutter build'
alias flc='flutter clean'
alias flbi='flutter build ios'
alias flba='flutter build apk'

# git {{{
alias gh="open \`git remote -v | grep fetch | head -1 | cut -f2 | cut -d' ' -f1 | sed -e's/git@/http:\/\//' -e's/\.git$//' | sed -E 's/(\/\/[^:]*):/\1\//'\`"
# git format patch
gof() {
  git checkout -b $2-mig-$3
  git format-patch --keep-subject --stdout origin/$2..origin/$1 -- $3 | git am -3 --keep
}
# git oca black / isort / prettier
gob() {
  git commit -m "[IMP] $1: black, isort, prettier" --no-verify
}
# git oca commit
gom() {
  git commit -m "[MIG] $1: Migration to 14.0"
}
# }}}

# apt
alias sau='sudo apt update'
alias sai='sudo apt install'
alias sar='sudo apt autoremove'
alias saa='sudo add-apt-repository -y -u'

alias dus='df -h | grep sda3'

# docker-compose
alias dcu='docker-compose up'

# fd
alias fdd="fd --type d"
alias fdf="fd --type f"

# tmux
chu() {
  if ! tmux has-session -t $1; then
    tmux new -s $1 -d

    # 1st window
    tmux rename-window code
    # tmux send-keys vim\ -S\ $HOME/.nvim/session/df.vim Enter

    # 2nd window
    tmux new-window -t $1:2
    tmux rename-window test
    tmux split-window -h
    # tmux send-keys "btm -b" Enter
    tmux split-window
    # tmux send-keys "asciiquarium" Enter

    # 3nd window
    tmux new-window -t $1:3
    tmux rename-window monitor

    # post
    tmux select-window -t $1:1
  fi

  tmux attach -t $1
}

# Private local configs
if [[ -f "$HOME/.d/local.sh" ]]; then
  source $HOME/.d/local.sh
fi

# Magic
alias v="fd -t f --hidden --exclude .git | fzf-tmux -p | xargs nvim --noplugin"
