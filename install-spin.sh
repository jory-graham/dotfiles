#!/bin/bash

alias test="bin/test --include-branch-commits"
alias style="bin/style --include-branch-commits"
alias check="bin/check --include-branch-commits"
alias up="bundle install; bin/rails db:migrate"


# Install VS Code dev-test-runner extension
git clone git@github.com:Shopify/dev-test-runner /src/github.com/shopify/dev-test-runner
EXTENSIONS_DIR=/home/${USER}/.vscode-server/extensions
cp "$(find /src/github.com/shopify/dev-test-runner/*.vsix | tail -1)" "${EXTENSIONS_DIR}/dev-test-runner.vsix"
/usr/bin/code --extensions-dir="${EXTENSIONS_DIR}" --install-extension "${EXTENSIONS_DIR}/dev-test-runner.vsix"

# Setup beta flags
~/data/default/beta_flags.sh