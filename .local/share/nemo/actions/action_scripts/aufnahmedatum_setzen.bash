#!/bin/bash

DATE=$(zenity --calendar --title="Datum auswählen" --text="Wähle das Aufnahmedatum aus:" --date-format="%Y-%m-%d")

# Check if the user canceled the dialog
if [ $? -ne 0 ]; then
   exit 1
fi

TIME="12:00:00" # Default Time (it doesn't matter only date is important)
DATETIME="$DATE $TIME"

# Loop through all selected files
# Number files when renaming to avoid overwriting because there will be multiple files on the same date
# and they have to be different, ie. not all 'DTO_yyyy-mm-dd' but 'DTO_yyyy-mm-dd_i'
i=1
for FILE in "$@"; do
   if ! /usr/bin/exiftool -DateTimeOriginal="$DATETIME" "$FILE"; then
      zenity --info --text="Error for $FILE."
      exit 1
   fi
   # Rename file to include DateTimeOriginal info
   filename=$(basename -- "$FILE")
   mv "$FILE" "$(dirname "$FILE")""/DTO_$DATE""_$i.${filename##*.}"
   i=$((i+1))
done
