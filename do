#!/usr/bin/env bash

SCRIPT="uk.pxul.launch-daemon-test.plist"
DST="/Library/LaunchDaemons"

function load() {
  sudo cp "$SCRIPT" "$DST"
  sudo chmod 644 "$DST/$SCRIPT"
  sudo chown root:wheel "$DST/$SCRIPT"
  sudo launchctl unload "$DST/$SCRIPT"
  sudo launchctl load "$DST/$SCRIPT"
}

function logs() {
  tail -f /var/log/uk.pxul.launch-daemon-test-*.log
}

function usage() {
    echo "Usage: $0 <load|logs>"
    exit 1
}

case $1 in
load)
  load
  ;;
logs)
  logs
  ;;
*)
  usage
  ;;
esac
