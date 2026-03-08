#!/bin/bash

set -e

REPO_DIR="$HOME/Desktop/TeamBenSDK/tb-dev-shell"
GIT_REPO="https://github.com/k0nics/tb-dev-shell.git"

echo "Installing TB Dev Shell..."

# Clone or update repo
if [ ! -d "$REPO_DIR" ]; then
  echo "Cloning repository..."
  git clone $GIT_REPO $REPO_DIR
else
  echo "Repository already exists. Updating..."
  cd "$REPO_DIR"
  git pull --quiet
fi

# Create loader file
cat > "$REPO_DIR/tb.sh" << EOF
BASE_DIR="$REPO_DIR"

cd "\$BASE_DIR" && git pull --quiet

source "\$BASE_DIR/shell/aliases.sh"
source "\$BASE_DIR/shell/git.sh"
source "\$BASE_DIR/shell/laravel.sh"
source "\$BASE_DIR/shell/node.sh"
EOF

# Make CLI executable
chmod +x "$REPO_DIR/bin/tb"

# Add PATH safely
add_path() {
  FILE=$1

  if [ -f "$FILE" ]; then
    if ! grep -q "TeamBenSDK/tb-dev-shell/bin" "$FILE"; then
      echo "" >> "$FILE"
      echo "# TB DEV SHELL PATH" >> "$FILE"
      echo "export PATH=\"$REPO_DIR/bin:\$PATH\"" >> "$FILE"
    fi
  fi
}

add_path "$HOME/.zshrc"
add_path "$HOME/.bashrc"
add_path "$HOME/.bash_profile"

echo ""
echo "Installation complete 🎉"
echo ""
echo "Restart terminal OR run:"
echo "source ~/.zshrc"
echo "or"
echo "source ~/.bashrc"
echo ""
echo "Run 'tb' to test CLI"