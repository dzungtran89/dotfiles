#!/usr/bin/env sh

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

if [ -z "$XDG_CONFIG_HOME" ]; then
  export XDG_CONFIG_HOME=$HOME/.config
fi

# export PATH=$HOME/code/github/dotfiles/git/diff-so-fancy:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH="$PATH:/opt/mssql-tools/bin:/home/linuxbrew/.linuxbrew/bin"

# export NVM_DIR="$HOME/.config/nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ssh to host by hostname :)
# TODO: check $SHELL
zstyle ':completion:*:(ssh|scp|ftp|sftp):*' hosts $hosts
zstyle ':completion:*:(ssh|scp|ftp|sftp):*' users $users

# fzf loves fd {{{

# fzf's command
export FZF_DEFAULT_COMMAND="fd --type file --follow --hidden --exclude .git"

# CTRL-T's command
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# ALT-C's command
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"
export FZF_DEFAULT_OPTS="--height=80%"

_fzf_compgen_path() {
  fd . "$1"
}
_fzf_compgen_dir() {
  fd --type d . "$1"
}
# aliases
alias open='xdg-open'
alias nnn="nnn -deH"
if [ -f ~/.sh_aliases ]; then
  . ~/.sh_aliases
fi

pylink(){
    ln -sf $HOME/.asdf/installs/python/$@ $HOME/.pythonz/pythons/CPython-$@
}

# added by Pew
# source "$(pew shell_config)"

# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"

# if command -v pyenv 1>/dev/null 2>&1; then
#  eval "$(pyenv init -)"
# fi

n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

if [ -z "$SSH_AUTH_SOCK" ] ; then
    {eval `ssh-agent`; ssh-add ~/.ssh/id_ed25519;} &>/dev/null
fi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
