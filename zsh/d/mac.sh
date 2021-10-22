# export TERM=xterm-256color

export EDITOR=vi
export VISUAL=vi
export GIT_EDITOR=vi

if [ -z "$XDG_CONFIG_HOME" ]; then
  export XDG_CONFIG_HOME=$HOME/.config
fi

# openssl@1.1
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

export LDFLAGS="-L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/bzip2/include"

# go-lang
export GOPATH=$HOME/go-workspace
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

export PATH=/usr/local/opt/grep/libexec/gnubin:/usr/local/sbin:$PATH
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH

# doom-emacs
export PATH=$HOME/.emacs.d/bin:$PATH

# psql
export PGDATA=/usr/local/var/postgres
export PGHOST=localhost

# flutter
export PATH=$PATH:$HOME/sdk/flutter/bin

# shopt -s promptvars

# zlib
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/zlib/lib/pkgconfig"

# libffi
export LDFLAGS="${LDFLAGS} -L/usr/local/opt/libffi/lib"
export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/libffi/include"
export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/libffi/lib/pkgconfig"

# jekyll
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.7.0/bin:$PATH"
export PATH="/usr/local/opt/texinfo/bin:$PATH"

# java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-14.0.2.jdk/Contents/Home"

# ssh to host by hostname :)
# TODO: check $SHELL
zstyle ':completion:*:(ssh|scp|ftp|sftp):*' hosts $hosts
zstyle ':completion:*:(ssh|scp|ftp|sftp):*' users $users
