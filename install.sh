#!/bin/bash

set -e

REPO_DIR="$HOME/.tb-dev-shell"
GIT_REPO="https://github.com/k0nics/tb-dev-shell.git"

echo "Installing TB Dev Shell..."

# Clone repo if not exists
if [ ! -d "$REPO_DIR" ]; then
  echo "Cloning repository..."
  git clone $GIT_REPO $REPO_DIR
else
  echo "Repository already exists. Updating..."
  cd $REPO_DIR
  git pull
fi

add_source () {
  FILE=$1

  if [ -f "$FILE" ]; then
    if ! grep -q "TB DEV SHELL START" "$FILE"; then
      echo "" >> "$FILE"
      echo "# TB DEV SHELL START" >> "$FILE"
      echo "source $REPO_DIR/shell/aliases.sh" >> "$FILE"
      echo "source $REPO_DIR/shell/git.sh" >> "$FILE"
      echo "source $REPO_DIR/shell/laravel.sh" >> "$FILE"
      echo "source $REPO_DIR/shell/node.sh" >> "$FILE"
      echo "# TB DEV SHELL END" >> "$FILE"

      echo "Added TB Dev Shell to $FILE"
    else
      echo "TB Dev Shell already configured in $FILE"
    fi
  fi
}

add_source "$HOME/.zshrc"
add_source "$HOME/.bashrc"
add_source "$HOME/.bash_profile"

echo ""
echo "Installation complete 🎉"
echo ""
echo "Restart terminal OR run:"
echo ""
echo "source ~/.zshrc"
echo "or"
echo "source ~/.bashrc"