#!/bin/bash
set -euo pipefail

JAR_FILE="paper-1.21.7-32.jar"

if [[ ! -f "$JAR_FILE" ]]; then
  echo "❌ JAR file '$JAR_FILE' not found in $(pwd)"
  exit 1
fi

echo "✅ Starting Minecraft server with $JAR_FILE"
exec java -Xms4G -Xmx8G -jar "$JAR_FILE" nogui