tell application "IntelliJ IDEA CE" to activate
delay 0.5
tell application "System Events"
    key code 31 using {shift down, command down}
    delay 0.5
    key code 9 using {command down}
    delay 0.5
    key code 36
end tell
