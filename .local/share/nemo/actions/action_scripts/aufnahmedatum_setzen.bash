#!/bin/bash

DATE=$(zenity --calendar --title="Datum auswählen" --text="Wähle das Aufnahmedatum aus:" --date-format="%Y-%m-%d")

# Check if the user canceled the dialog
if [ $? -ne 0 ]; then
   exit 1
fi

TIME="12:00:00" # Default Time (it doesn't matter only date is important)
DATETIME="$DATE $TIME"

# Loop through all selected files
for FILE in "$@"; do
   if ! /usr/bin/exiftool -DateTimeOriginal="$DATETIME" "$FILE"; then
      zenity --info --text="Error for $FILE."
      exit 1
   fi
   # Rename file to include DateTimeOriginal info
   filename=$(basename -- "$FILE")
   # Include old filename to guarantee that the new image is unique
   # Old approach (`DTO_$DATE_$i`) included a counter but when executed two times on two different fotos,
   # the first image was overwritten.
   mv "$FILE" "$(dirname "$FILE")""/${filename%.*}_DTO_$DATE.${filename##*.}"
done
