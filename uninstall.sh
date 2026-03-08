#!/bin/bash

REPO_DIR="$HOME/.tb-dev-shell"

echo "Uninstalling TB Dev Shell..."

remove_source () {
  FILE=$1

  if [ -f "$FILE" ]; then
    sed -i.bak '/# TB DEV SHELL START/,/# TB DEV SHELL END/d' "$FILE"
    echo "Removed TB Dev Shell from $FILE"
  fi
}

remove_source "$HOME/.zshrc"
remove_source "$HOME/.bashrc"
remove_source "$HOME/.bash_profile"

if [ -d "$REPO_DIR" ]; then
  rm -rf "$REPO_DIR"
  echo "Deleted $REPO_DIR"
fi

echo "TB Dev Shell successfully removed."