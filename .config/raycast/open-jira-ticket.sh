#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Jira ticket
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "SM-xxxx" }
# @raycast.packageName open-jira-ticket

# Documentation:
# @raycast.author topcbl
# @raycast.authorURL https://raycast.com/topcbl

open "https://personio.atlassian.net/browse/$1"
