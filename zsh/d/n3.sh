export NNN_COLORS="2136"

is_mac() {
  uname | grep -q "Darwin"
}

NNN_PLUG_DEFAULT='1:ipinfo;p:preview-tui;o:fzz;b:nbak'
NNN_PLUG="$NNN_PLUG_DEFAULT"
export NNN_PLUG

export NNN_BMS="h:~;d:~/Documents;c:~/code;g:~/code/github;o:~/code/github/abc-og;m:~/Movies"
export NNN_USE_EDITOR=1
# export NNN_OPENER="$HOME/.scripts/nnn/plugins/nuke"
# export NNN_COPIER="$HOME/.scripts/nnn/plugins/copy"
# export NNN_SCRIPT="$HOME/.scripts/nnn/plugins/makewall"

# preview-tabbed
export NNN_FIFO=/tmp/nnn.fifo
export NNN_TRASH=0

n () {
  if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
    echo "nnn is already running"
    return
  fi

  export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
  env KITTY_LISTEN_ON=tcp:localhost:20000 nnn "$@"

  if [ -f "$NNN_TMPFILE" ]; then
    . "$NNN_TMPFILE"
    rm -f "$NNN_TMPFILE" > /dev/null
  fi
}
