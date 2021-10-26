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
alias vs='vim -S $@'
alias vno='vim -u NORC $@'

# yabai
alias ycf='yabai -m config $@'

# hugo
alias hs='hugo server'

alias bu='buku'
alias b='bu --suggest'
alias n3='nnn'
alias nnn="nnn -eH"

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

# pyenv
alias pv='pyenv virtualenv'
alias pa='pyenv activate'
alias pd='pyenv deactivate'

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

# postgres
alias brupsql='brew postgresql-upgrade-database'

# tmux
alias tn='tmux new -s'
alias ta='tmux attach -t'
alias tmls='tmux ls'

alias lt='tree -la -L'

if command -v exa &> /dev/null; then
  alias ls='exa'
  alias la='ls -lah'
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
  if ! tmux has-session -t chu; then
    tmux new -s chu -d

    # 1st window
    tmux rename-window work
    tmux send-keys vim\ -S\ $HOME/.nvim/session/df.vim Enter
    tmux split-window
    tmux split-window -h
    tmux send-keys n Enter
    tmux split-window -h asciiquarium
    tmux select-layout main-horizontal

    # 2nd window
    tmux new-window -t chu:2
    tmux rename-window conf
    tmux split-window -h htop
    tmux split-window
    # tmux split-window cmatrix -u 10

    # post
    tmux select-window -t chu:1
    tmux select-pane -t 1
  fi

  tmux attach -t chu
}

# SPECIFIC ALIASES {{{
# OCA
alias oca='cd ~/code/oca ; pew in oca oca.sh'

# }}}