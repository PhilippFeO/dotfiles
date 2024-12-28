#!/bin/bash
# Skript, um per Rechtsklick leichter harte Links im Dateiexplorer „nemo“ anlegen zu können

file_name=$1

# Prüfen, ob Datei ausgewählt wurde
if [ "$file_name" = "" ]; then
	notify-send "Keine Datei ausgewählt."
elif [ -d "$file_name" ]; then
	notify-send "Harte Links auf Verzeichnisse nicht möglich."
else
	# Auswahl des Verzeichnisses des Nutzers speichern
	#destination=$(zenity --entry --text="Zielverzeichnis für Datei „$file_name“ eingeben:")
	destination=$(zenity --file-selection --directory) 

	# Harten Link erzeugen
	ln "$file_name" "$destination"
fi
