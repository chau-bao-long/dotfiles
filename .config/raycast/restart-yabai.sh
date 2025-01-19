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

yabai --restart-service
brew services restart sketchybar
