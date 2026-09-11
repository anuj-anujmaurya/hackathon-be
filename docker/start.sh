#!/usr/bin/env sh
set -eu

if [ -z "${APP_KEY:-}" ] || [ "${APP_KEY}" = "base64:" ]; then
  php artisan key:generate --force --no-interaction || true
fi

php artisan config:cache
php artisan migrate --force --no-interaction

exec php artisan serve --host=0.0.0.0 --port="${PORT:-8080}"
