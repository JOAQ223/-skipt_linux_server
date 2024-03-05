#!/bin/bash

# Dieses Skript lädt ein Modul und entfernt es.

MODULNAME="example_module"

# Lade das Modul.
echo "Lade das Modul: $MODULNAME"
sudo modprobe $MODULNAME

# Warte einen Moment und entferne das Modul dann wieder.
echo "Warte für 10 Sekunden..."
sleep 10

echo "Entferne das Modul: $MODULNAME"
sudo modprobe -r $MODULNAME

echo "Fertig."
