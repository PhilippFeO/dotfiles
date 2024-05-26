#!/bin/bash

# sleep 5

# Terminal
# wmctrl -r ~ -t 2

# Wiki
wmctrl -r Wiki -t 1

# # Firefox mit Tagebucheintrag der vergangenen Jahre
# diary_winID=$(wmctrl -l | grep "Heute," | grep -v grep | cut -d ' ' -f 1)
# wmctrl -i -r "$diary_winID" -t 5
