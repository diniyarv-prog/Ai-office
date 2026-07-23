# Подключение к существующему ежедневному Mac-sync

Если на Mac уже есть ежедневный скрипт/автоматизация для pull/push памяти Hermes, отдельный `launchd` для AI Office не нужен.

Добавь в существующий ежедневный скрипт одну строку:

```bash
bash "$HOME/AI-Office-Memory/scripts/mac_daily_pull_ai_office.sh"
```

Если репозиторий ещё не склонирован на Mac, сначала:

```bash
git clone https://github.com/diniyarv-prog/Ai-office.git "$HOME/AI-Office-Memory"
```

Что делает hook:

1. Проверяет `~/AI-Office-Memory`.
2. Если папки нет — клонирует репозиторий.
3. Если есть — делает `git pull --rebase origin main`.
4. Локальная машина получает свежую память AI Office из GitHub.

Поток остаётся таким:

```text
Telegram AI Office → сервер Hermes → GitHub → Mac daily sync
```

Важно: GitHub остаётся источником правды. Mac только подтягивает.
