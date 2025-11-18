#! /bin/bash
#-----------------------------------------------------------------------------------------------------------------------
# Script to 'Create Date' tag of Exif metadata for media files in a Zenity/Nemo dialog using 'exiftool' utility.
#
# See 'https://exiftool.org/', 'https://exiftool.sourceforge.net/' and 'https://github.com/exiftool/exiftool'
# for 'exiftool' utility.
#-----------------------------------------------------------------------------------------------------------------------

# exiftool gibt CreateDate mit vielen Leerzeichen zwischen Tag-Name und : aus. Finde ich unschön, deswegen wird dieser große Leerraum gekürzt und der : zum Tag verschoben
createdate_exif_data=$(exiftool -CreateDate "$1" | sed 's/   *:/:   /')

# prepare the text to be displayed and arrange for rendering
text_to_display="${createdate_exif_data}"
echo "${text_to_display}" \
  | zenity --text-info \
           --title="EXIF-Daten für '${1##*/}'" \
           --width=800 \
           --height=150 \
           --window-icon=exifinfo \
           --font='FiraCode Nerd Font'
