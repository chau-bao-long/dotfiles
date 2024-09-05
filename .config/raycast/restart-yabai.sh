#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title restart yabai
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description Restart Yabai service
# @raycast.author topcbl
# @raycast.authorURL https://raycast.com/topcbl

# Restart yabai service
yabai --restart-service

# Restart ubersicht bar
ps -ef | sed 1d | grep -m1 'bersicht' | awk '{print $2}' | xargs kill -9
open -na Übersicht
