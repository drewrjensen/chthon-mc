#!/bin/bash
set -e

# Copy jar if not already in /data
if [ ! -f /data/paper-1.21.7-32.jar ]; then
  cp /paper-1.21.7-32.jar /data/
fi

cd /data
exec java -jar paper-1.21.7-32.jar