#! /bin/bash
#-----------------------------------------------------------------------------------------------------------------------
# Script to implement rendering of GPS locations from Exif metadata in OpenStreetMap mapping service
# and for evaluation of conditions for related Nemo action to be displayed in the context menu.
#-----------------------------------------------------------------------------------------------------------------------

# define specific function for URL formatting, specified in 'exif_metadata__mapping.bash'
format_url () {
  # Wandle $1="12.45, 67,89" in [12,45 67,89] um, um Kartenausschnitt in URL (map=…) definieren zu können.
  #   Quelle: https://stackoverflow.com/questions/918886/how-do-i-split-a-string-on-a-delimiter-in-bash
  # Vorgehen:
  #   1. Ersetze ", " durch " "
  #   2. (…) teilt String an Leerzeichen und wandelt alles in Array um
  # Hätte String mehrere Leerzeichen/Leerzeichen an anderen Stellen würde das nicht funktionieren!
  arrCoords=(${1/, / })  # Hier möchte ich „SC2206: Word splitting“, weil ich aus "12,45 67,89" ein Array mit diesen beiden Werten machen möchte => Warnung ignorieren/nicht beheben
  # Erstes Argument von map beschreibt Vergrößerung
  url="https://www.openstreetmap.org/?mlat=${1/, /\&mlon=}#map=17/${arrCoords[0]}/${arrCoords[1]}"
}

# source/call the generic script for handling GPS locations
. "$(dirname "$0")/exif_metadata__mapping.bash"
