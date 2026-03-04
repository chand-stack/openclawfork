#!/bin/bash
# Apply OpenClaw config for Railway deployment (Control UI origin fix)
# Run this when your Railway service is RUNNING: ./railway-apply-config.sh

set -e
cd "$(dirname "$0")"

echo "Applying gateway.controlUi config via Railway SSH..."

railway ssh openclaw config set gateway.controlUi.dangerouslyAllowHostHeaderOriginFallback true
railway ssh openclaw config set 'gateway.controlUi.allowedOrigins' '["https://openclaw-main-production-3766.up.railway.app","http://openclaw-main-production-3766.up.railway.app"]' --strict-json
railway ssh openclaw config set 'plugins.entries.device-pair.config.publicUrl' '"https://openclaw-main-production-3766.up.railway.app"' --strict-json

echo "Config applied. The gateway will auto-reload. If not, redeploy: railway redeploy --yes"
