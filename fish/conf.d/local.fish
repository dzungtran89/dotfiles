#vim:tabstop=2

set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8

if test -z "$XDG_CONFIG_HOME"
  set -x XDG_CONFIG_HOME $HOME/.config
end

if test -z (pgrep ssh-agent | string collect)
  eval (ssh-agent -c)
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
  set -Ux SSH_AGENT_PID $SSH_AGENT_PID
  ssh-add ~/.ssh/id_ed25519
  sudo pg_ctlcluster 12 main start
end

if status --is-login
    set -x PATH $HOME/.local/bin $PATH
end

# Magic Symlinks
ln -sf $HOME/.local/share/virtualenvs $HOME/.virtualenvs
function pylink
    ln -sf $HOME/.asdf/installs/python/$argv $HOME/.pythonz/pythons/CPython-$argv
end

# # fzf's command
# set -gx FZF_DEFAULT_COMMAND "fd --type file --follow --hidden --exclude .git"
# 
# # CTRL-T's command
# set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
# 
# # ALT-C's command
# set -gx FZF_ALT_C_COMMAND "$FZF_DEFAULT_COMMAND --type d"
# set -gx FZF_DEFAULT_OPTS "--height=80%"
# 
# function _fzf_compgen_path
#   fd . $argv
# end
# 
# function _fzf_compgen_dir
#   fd --type d . $argv
# end

# cd on quit
set -x NNN_COLORS "2136"
set -x NNN_TRASH 0

function n --wraps nnn --description 'support nnn quit and change directory'
    # Block nesting of nnn in subshells
    if test -n "$NNNLVL"
        if [ (expr $NNNLVL + 0) -ge 1 ]
            echo "nnn is already running"
            return
        end
    end

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "-x" as in:
    #    set NNN_TMPFILE "$XDG_CONFIG_HOME/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    if test -n "$XDG_CONFIG_HOME"
        set -x NNN_TMPFILE "$XDG_CONFIG_HOME/nnn/.lastd"
    else
        set -x NNN_TMPFILE "$HOME/.config/nnn/.lastd"
    end

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn $argv

    if test -e $NNN_TMPFILE
        source $NNN_TMPFILE
        rm $NNN_TMPFILE
    end
end

# set -x WORKON_HOME $HOME/.local/share/virtualenvs
# set -x PROJECT_HOME $HOME/code/projects

# # Functions

# function envmk
#   virtualenv -p (asdf where python $argv[1])/bin/python $WORKON_HOME/$argv[2]
# end

# function envon
#   source $WORKON_HOME/$argv[1]/bin/activate
#   if test -d $PROJECT_HOME/$argv[1]
#     cd $PROJECT_HOME/$argv[1]
#   end
# end

# --------------------------------------------------------
# Aliases
# --------------------------------------------------------
alias open="xdg-open"
alias nnn='nnn -deH'
alias fa='alias | grep'
alias lt='tree -la -L'
alias cl='clear'
alias cpath='pwd|pbcopy'
alias diskusage='iostat -Id disk0'

# flutter
alias fl='flutter'
alias flb='flutter build'
alias flc='flutter clean'
alias flbi='flutter build ios'
alias flba='flutter build apk'

# vim
alias vim='nvim'
alias vs='vim -S $argv'
alias vno='vim --noplugin $argv'

# tmux
alias tn='tmux new -s'
alias ta='tmux attach -t'
alias tmls='tmux ls'

# yabai, skhd
alias yres='launchctl kickstart -k "gui/$UID/homebrew.mxcl.yabai"'
alias sres='launchctl kickstart -k "gui/$UID/homebrew.mxcl.skhd"'

alias lgit='lazygit'
alias ldocker='lazydocker'

# fd
alias fdd="fd --type d"
alias fdf="fd --type f"
