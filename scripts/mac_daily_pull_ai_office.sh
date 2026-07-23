#!/usr/bin/env bash
set -euo pipefail

# Hook this file into Diniyar's existing daily Mac sync/push job.
# It keeps the local AI Office memory repo fresh from GitHub.

REPO_URL="https://github.com/diniyarv-prog/Ai-office.git"
REPO_DIR="${HOME}/AI-Office-Memory"

if ! command -v git >/dev/null 2>&1; then
  echo "git is not installed"
  exit 1
fi

if [ ! -d "$REPO_DIR/.git" ]; then
  git clone "$REPO_URL" "$REPO_DIR"
fi

cd "$REPO_DIR"
git pull --rebase origin main

echo "AI Office memory updated: $REPO_DIR"
