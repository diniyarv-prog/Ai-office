#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="/srv/hermes/workspace/ai-office-memory-sync"
cd "$REPO_DIR"

# Pull first to avoid overwriting remote changes.
git pull --rebase origin main || true

# Refresh dynamic files from Hermes workspace.
if [ -f /srv/hermes/workspace/ai-office-telegram-topics.json ]; then
  cp /srv/hermes/workspace/ai-office-telegram-topics.json config-telegram-topics.json
fi

# Commit only if something changed.
if ! git diff --quiet || ! git diff --cached --quiet; then
  git add .
  git commit -m "daily ai office memory sync $(date +%F)"
  git push origin main
else
  echo "No AI Office memory changes to push."
fi
