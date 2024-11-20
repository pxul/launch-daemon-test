#!/usr/bin/env bash

SCRIPT="uk.pxul.launch-daemon-test.plist"
DST="/Library/LaunchDaemons"

function load() {
  sudo cp "$SCRIPT" "$DST"
  sudo chmod 644 "$DST/$SCRIPT"
  sudo chown root:wheel "$DST/$SCRIPT"
  sudo launchctl load "$DST/$SCRIPT"
}

function unload() {
  sudo launchctl unload "$DST/$SCRIPT"
  sudo rm -f "$DST/$SCRIPT"
}

function reload() {
  unload
  load
}

function logs() {
  tail -f /var/log/uk.pxul.launch-daemon-test-*.log
}

function usage() {
    echo "Usage: $0 <load|unload|reload|logs>"
    exit 1
}

case $1 in
load)
  load
  ;;
unload)
  unload
  ;;
reload)
  reload
  ;;
logs)
  logs
  ;;
*)
  usage
  ;;
esac
