#!/bin/bash
# Via this script it is possible to toggle a mono or dual monitor setup (with side monitor to the left
# of the center one) when using herbstluftwm.

hl_tag=$(herbstclient tag_status | python3 retrieve_tag.py) # save current tag/workspace

# Anschalten
if [ $(xrandr --listactivemonitors | cut -d: -f2 | head -1) -eq 1 ]; then # retrieve active monitors (first line of <xrandr --listactivemonitors>)
    xrandr --output HDMI-1 --auto # Turn on left HDMI-1 monitor
    ~/.config/herbstluftwm/herbstluftwm-monitor-setup.sh # Run monitor setup script (which is also done in file autostart)
    herbstclient detect_monitors # detect new monitor setup (otherwise herbstluft has internally still one monitor (<hc list_monitors> shows one))
    herbstclient focus_monitor 1 # focus main (middle) monitor (it has always index 1)
    herbstclient use $hl_tag # switch to original tag/workspace
else
    # Ausschalten
    #if [ $(xrandr --listactivemonitors | cut -d: -f2 | head -1) -eq 2 ]; then
    #   Doesn't work with two if-blocks because they cancel each other
    xrandr --output HDMI-1 --off # Turn off left HDMI-1 monitor
    herbstclient set_monitors 2560x1440+0+0 # Tell hc the new monitor configuration
    herbstclient use $hl_tag # switch to original tag/workspace
fi
