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

sudo yabai --load-sa
yabai --restart-service
