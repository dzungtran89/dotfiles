#!/usr/bin/env sh

## Env variables
export E=/Volumes/ex01
export EHOME=$E/Library/Containers

## Symbolic links

# Create a symlink to External Drive to preserve internal drive.
ln -sf $EHOME/com.docker.docker $HOME/Library/Containers

# Projects

