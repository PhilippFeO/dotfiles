#! /bin/bash
#-----------------------------------------------------------------------------------------------------------------------
# Script to extracht 'Date/Time Original' and 'GPS Position' tags of Exif metadata for media files in a Zenity/Nemo dialog using 'exiftool' utility.
#
# See 'https://exiftool.org/', 'https://exiftool.sourceforge.net/' and 'https://github.com/exiftool/exiftool'
# for 'exiftool' utility.
#
# Zum zenity-Befehl:
#   “ ist in "" nicht gerne gesehen, deswegen wird alles mit diesem Zeichen in '' gepackt.
#   Variablen-Expansion in '' nicht möglich
#   ==> Viele verschiedene Anführungszeichen
#-----------------------------------------------------------------------------------------------------------------------

createdate_exif_data=$(exiftool -DateTimeOriginal -GPSPosition "$1")

# prepare the text to be displayed and arrange for rendering
text_to_display="${createdate_exif_data}"
echo "${text_to_display}" \
  | zenity --text-info \
      --title='„Date/Time Original“  & „GPS Position“ für „'"${1##*/}"'“' \
      --width=800 \
      --height=150 \
      --window-icon=exifinfo \
      --font='FiraCode Nerd Font'
