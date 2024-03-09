#!/bin/bash

# Physische Volumes initialisieren, falls noch nicht geschehen
pvcreate /dev/sda1 /dev/sdb1
if [ $? -ne 0 ]; then
    echo "Fehler beim Initialisieren der physischen Volumes."
    exit 1
fi

# Eine neue Volume-Gruppe namens "vgdata" erstellen
vgcreate vgdata /dev/sda1 /dev/sdb1
if [ $? -ne 0 ]; then
    echo "Fehler beim Erstellen der Volume-Gruppe 'vgdata'."
    exit 1
fi

# Bestätigung und Details der neuen Volume-Gruppe anzeigen
vgdisplay vgdata
if [ $? -ne 0 ]; then
    echo "Fehler beim Anzeigen der Volume-Gruppe 'vgdata'."
    exit 1
fi

echo "Die Volume-Gruppe 'vgdata' wurde erfolgreich erstellt und konfiguriert."
