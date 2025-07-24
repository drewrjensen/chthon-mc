#!/bin/bash
set -e

# JAR_FILE="paper-${MC_VERSION}-${CMC_VERSION}.jar"
JAR_FILE="paper-1.21.7-32.jar"

if [[ ! -f "$JAR_FILE" ]]; then
  echo "❌ JAR file '$JAR_FILE' not found in $(pwd)"
  echo "💤 Sleeping indefinitely to allow debugging..."
  tail -f /dev/null
else
  echo "✅ Found JAR: $JAR_FILE"
  exec java -jar "$JAR_FILE"
fi