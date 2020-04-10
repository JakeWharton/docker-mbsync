#!/bin/sh

set -e

echo "INFO: Starting sync.sh PID $$ $(date)"

if [ "$(lsof | grep -c "$0" | tr -d ' ')" -gt 1 ]; then
  echo "WARNING: A previous sync is still running. Skipping new sync command."
else
  echo $$ > /tmp/sync.pid
  echo "INFO: Starting sync!"

  if [ -z "$HEALTHCHECK_ID" ]; then
    echo "INFO: Define HEALTHCHECK_ID with https://healthchecks.io to monitor sync job"
  else
    curl -sS -X POST "https://hc-ping.com/$HEALTHCHECK_ID/start"
  fi

  mbsync -V -a -c /config/mbsync.rc

  if [ -n "$HEALTHCHECK_ID" ]; then
    curl -sS -X POST "https://hc-ping.com/$HEALTHCHECK_ID"
  fi

  rm -f /tmp/sync.pid
fi
