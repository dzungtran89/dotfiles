export WORKON_HOME=$HOME/.local/share/virtualenvs
export PROJECT_HOME=$HOME/code/projects

envmk(){
  virtualenv -p $(asdf where python "$1")/bin/python "$WORKON_HOME"/"$2"
}

envon(){
  source "$WORKON_HOME"/"$1"/bin/activate
  [ -d "$PROJECT_HOME"/"$1" ] && cd "$PROJECT_HOME"/"$1"
}
