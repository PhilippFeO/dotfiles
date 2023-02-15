#!/bin/bash
#
# Da ich nicht immer 2 Monitore nutze und manchmal im Betrieb einen an- oder abstecke,
# wollte ich ein Skript schreiben, dass diesen Prozess automatisiert und die neue
# Konfiguration <herbstclient> bekannt macht. Im Terminal funktioniert das Skript aber
# nicht, wenn ich es per @reboot in die crontab schreibe.

# Läuft jede Sekunde und prüft Anschlüsse
# steht auskommentiert in der crontab
while:; do
    # HDMI-1 entfernen
    HDMI1_disconnected=$(xrandr | grep "HDMI-1 disconnected")
    HDMI1_listedactive=$(xrandr --listactivemonitors | grep "HDMI-1")
    if [ "$HDMI1_disconnected" != "" ] && [ "$HDMI1_listedactive" != "" ]; then
       hl_tag2=$(herbstclient tag_status | python3 retrieve_tag.py)
       #echo $hl_tag2
       xrandr --output "HDMI-1" --off
       # echo "[$(date)] --- HDMI-1 turned off."
       herbstclient detect_monitors #...Herbstluftwm muss nicht neu gestartet werden
       # echo "[$(date)] --- herbstclient detect_monitors."
       herbstclient use $hl_tag2
    fi

    # HDMI-1 hinzufügen
    HDMI1_connected=$(xrandr | grep "HDMI-1 connected")
    HDMI1_notactive=$(xrandr --listactivemonitors | grep "HDMI-1")
    if [ "$HDMI1_connected" != "" ] && [ "$HDMI1_notactive" == "" ]; then
       xrandr --output "HDMI-1" --auto
       # echo "[$(date)] --- HDMI-1 turned on."
       # Aktuellen Tag speichern, da <herbstclient reload> ihn
       # nicht konserviert
       hl_tag=$(herbstclient tag_status | python3 retrieve_tag.py)
       # Herbstluftwm neu starten sonst wird Bild nur gespiegelt
       herbstclient reload
       # Notwendig, sonst klappt es nicht
       #   Herausgefunden, indem ich die Befehle im Terminal
       #   eingab, die zusätzliche Zeit ist scheinbar notwendig.
       sleep 2
       # zu gespeichertem Tag wechseln
       herbstclient focus_monitor 1
       herbstclient use $hl_tag
       # echo "[$(date)] --- herbstclient reload."
    fi
    sleep 1
done
