#!/bin/bash

set -e

REPO_DIR="$HOME/Desktop/TeamBenSDK/tb-dev-shell"
GIT_REPO="https://github.com/k0nics/tb-dev-shell.git"

echo "Installing TB Dev Shell..."

# Clone or update repo
if [ ! -d "$REPO_DIR" ]; then
  echo "Cloning repository..."
  git clone "$GIT_REPO" "$REPO_DIR"
else
  echo "Repository already exists. Updating..."
  cd "$REPO_DIR"
  git pull --quiet
fi

# Create loader file
cat > "$REPO_DIR/tb.sh" << EOF
source "$REPO_DIR/shell/aliases.sh"
source "$REPO_DIR/shell/docker.sh"
source "$REPO_DIR/shell/git.sh"
source "$REPO_DIR/shell/laravel.sh"
source "$REPO_DIR/shell/node.sh"
EOF

# Make CLI executable
chmod +x "$REPO_DIR/bin/tb"

# Add the CLI path and shell functions safely.
add_shell_config() {
  FILE=$1

  if [ -f "$FILE" ]; then
    if ! grep -q "# TB DEV SHELL START" "$FILE"; then
      echo "" >> "$FILE"
      echo "# TB DEV SHELL START" >> "$FILE"
      echo "export PATH=\"$REPO_DIR/bin:\$PATH\"" >> "$FILE"
      echo "source \"$REPO_DIR/tb.sh\"" >> "$FILE"
      echo "# TB DEV SHELL END" >> "$FILE"
    fi
  fi
}

# A new macOS or Linux account may not have created its primary profile yet.
case "${SHELL##*/}" in
  zsh)
    touch "$HOME/.zshrc"
    ;;
  bash)
    touch "$HOME/.bashrc"
    ;;
esac

add_shell_config "$HOME/.zshrc"
add_shell_config "$HOME/.bashrc"
add_shell_config "$HOME/.bash_profile"

echo ""
echo "Installation complete 🎉"
echo ""
echo "Restart terminal OR run:"
echo "source ~/.zshrc"
echo "or"
echo "source ~/.bashrc"
echo ""
echo "Run 'tb' to test CLI"
