#!/bin/sh
set -e

if [ -z "$VECTOR_CONFIG" ]; then
  echo "Error: VECTOR_CONFIG environment variable is not set or empty." >&2
  exit 1
fi

CONFIG_FILE="/tmp/vector.toml"

printf '%s' "$VECTOR_CONFIG" > "$CONFIG_FILE"
chmod 600 "$CONFIG_FILE"

exec vector --config "$CONFIG_FILE"
