#!/usr/bin/env bash

SCRIPT="uk.pxul.launch-daemon-test.plist"
DST="/Library/LaunchDaemons"

sudo cp "$SCRIPT" "$DST"
sudo chmod 644 "$DST/$SCRIPT"
sudo chown root:wheel "$DST/$SCRIPT"
sudo launchctl unload "$DST/$SCRIPT"
sudo launchctl load "$DST/$SCRIPT"
