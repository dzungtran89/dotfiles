[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_BASE=$(which fzf)
export HISTSIZE=4000
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt hist_ignore_space

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZ=20
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
FZF_CTRL_R_OPTS='--height 40%'

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
