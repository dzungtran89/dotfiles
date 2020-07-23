#!/bin/sh

# Source: https://gist.github.com/Anakros/30b26d6fc7ca3e76825a

# put this to crontab

# @daily ~/code/dotfiles/notify.sh

OSASCRIPT_PATH=$(which osascript)
BREW_PATH=/usr/local/bin/brew
OUTDATED_PKGS=$($BREW_PATH outdated --verbose)

if [ -z "$OSASCRIPT_PATH" ]; then
  echo "Osascript isn't installed!"
  exit 1
fi

if [ -z "$BREW_PATH" ]; then
  echo "Homebrew isn't installed!"
  exit 1
fi

if ! [ -z "$OUTDATED_PKGS" ]; then
  $OSASCRIPT_PATH -e "display notification \"$OUTDATED_PKGS\" with title \"Outdated packages\" sound name \"Glass\""
fi
