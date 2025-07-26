#!/bin/bash
set -e

echo "[OBS] Lancement OBS..."
export DISPLAY=${DISPLAY:-:0}
obs --startrecording --scene "Double Screen + Cam" --profile "vegito" --collection "vegito" --output /output

if [ $# -eq 0 ]; then
  echo "[entrypoint] No command passed, entering sleep infinity to keep container alive"
  wait "${bg_pids[@]}" &
  sleep infinity
else
  exec "$@"
fi