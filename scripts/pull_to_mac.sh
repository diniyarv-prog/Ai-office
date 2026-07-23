#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="${HOME}/AI-Office-Memory"
REPO_URL="https://github.com/diniyarv-prog/Ai-office.git"

if [ ! -d "$REPO_DIR/.git" ]; then
  git clone "$REPO_URL" "$REPO_DIR"
fi

cd "$REPO_DIR"
git pull --rebase origin main
