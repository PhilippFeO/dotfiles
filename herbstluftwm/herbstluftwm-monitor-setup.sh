#!/bin/bash
# Da ich zwei WQHD-Monitore habe und nicht immer alle nutze, habe ich ein Skript
# geschrieben, das beim Hochfahren erkennt, ob nur ein Monitor (der Haupt-WQHD-Monitor)
# oder beide, dh. auch der Neben-WQHD-Monitor, angeschlossen sind. Je nachdem werden die
# Monitore angesteuert und die Laptopanzeige ausgeschaltet. Das Skript funktioniert und
# steht so in autostart.


mainWQHD=$(xrandr -q | grep -e "DP-2 connected 2560x1440")
if [ "$mainWQHD" != "" ]; then
    # Laptopmonitor ausschalten
    xrandr --output eDP-1 --off
    # Eingang für Haupt-WQHD-Monitor filtern
    input=$(echo "$mainWQHD" | cut -d " " -f1)
    # Haupt-WQHD-Monitor als Primärbildschrim setzen
    xrandr --output "$input" --primary
fi


sideWQHD=$(xrandr -q | grep -e "HDMI-1 connected 2560x1440")
if [ "$sideWQHD" != "" ]; then
    # Eingang für Neben-WQHD-Monitor filtern
    input=$(echo "$sideWQHD" | cut -d " " -f1)
    # Neben-WQHD-Monitor links vom Haupt-WQHD-Monitor platzieren
    xrandr --output "$input" --left-of "DP-2"
fi
