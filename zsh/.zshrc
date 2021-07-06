IS_PURE=1
IS_STARSHIP=0
IS_P10K=0

if [[ $IS_P10K == 1 ]] then

  # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
  # Initialization code that may require console input (password prompts, [y/n]
  # confirmations, etc.) must go above this block; everything else may go below.
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi

fi

# vim:foldmethod=manual

# zmodload zsh/zprof

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# fix duplicated PATH, ref: https://github.com/bmorrall/dotfiles/commit/9ebfaf088ccedb7949cb25137a707ba6f561a211
# export -U PATH

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

ZSH_THEME="bira"

if [[ $IS_P10K == 1 ]] then
  ZSH_THEME="powerlevel10k/powerlevel10k"
fi

if [[ $IS_PURE == 1 ]] then
  ZSH_THEME=""
fi

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

plugins=(
  git
  vi-mode
  fzf
  docker
  zsh-z
  tig

  # osx
  # pass
  # python
  # docker
  # pyenv
  # autojump
)

source $ZSH/oh-my-zsh.sh

## Dir: current working directory

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

if [[ $IS_PURE == 1 ]] then;
  fpath+=$HOME/.zsh/pure
  autoload -U promptinit; promptinit

  # optionally define some options
  PURE_CMD_MAX_EXEC_TIME=10

  # # change the path color
  # zstyle :prompt:pure:path color white

  # # change the color for both `prompt:success` and `prompt:error`
  # zstyle ':prompt:pure:prompt:*' color cyan

  # turn on git stash status
  zstyle :prompt:pure:git:stash show yes
  prompt pure
fi

# Personal config
export FZF_BASE=$(which fzf)

export HISTSIZE=4000
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt hist_ignore_space

source ~/.sh_profile

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# [[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc

# nnn
export NNN_COLORS="2136"
export NNN_TRASH=0

# asdf
. $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)

export WORKON_HOME=$HOME/.local/share/virtualenvs
export PROJECT_HOME=$HOME/code/projects

envmk(){
  virtualenv -p $(asdf where python "$1")/bin/python "$WORKON_HOME"/"$2"
}

envon(){
  source "$WORKON_HOME"/"$1"/bin/activate
  [ -d "$PROJECT_HOME"/"$1" ] && cd "$PROJECT_HOME"/"$1"
}

if [[ $IS_P10K == 1 ]] then
  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi

if [[ $IS_STARSHIP == 1 ]] then
  eval "$(starship init zsh)"
fi

# lf cd on quit
lfcd () {
  tmp="$(mktemp)"
  lf -last-dir-path="$tmp" "$@"
  if [ -f "$tmp" ]; then
    dir="$(cat "$tmp")"
    rm -f "$tmp"
    if [ -d "$dir" ]; then
      if [ "$dir" != "$(pwd)" ]; then
        cd "$dir"
      fi
    fi
  fi
}

bindkey -s '^o' 'lfcd\n'

case `uname` in
  Darwin)
    alias lstat=stat
  ;;
  Linux)
    # commands for Linux go here
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac

