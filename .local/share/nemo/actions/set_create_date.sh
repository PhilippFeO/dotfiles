#!/bin/bash

DATE=$(zenity --calendar --title="Datum auswählen" --text="Wähle das Erstelldatum aus:" --date-format="%Y-%m-%d")

# Check if the user canceled the dialog
if [ $? -ne 0 ]; then
   exit 1
fi

TIME="12:00:00"
DATETIME="$DATE $TIME"

# Loop through all selected files
for FILE in "$@"; do
   if ! /usr/bin/exiftool -CreateDate="$DATETIME" "$FILE"; then
      zenity --info --text="Error for $FILE."
      exit 1
   fi
done
