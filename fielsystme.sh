#!/bin/bash

# Liste der Dateisystem-Gerätenamen
filesystems=(
    "/dev/sda1"
    "/dev/sda2"
    "/dev/sda3"
    "/dev/sdb1"
    "/dev/sdb2"
    # Fügen Sie hier mehr Gerätenamen hinzu, bis Sie 19 erreichen
)

# Anzahl der Mounts zwischen Überprüfungen
max_mounts=30

# Zeit zwischen Überprüfungen (in Monaten)
check_interval=1

for fs in "${filesystems[@]}"; do
    echo "Konfiguriere ${fs}..."
    # Setze die maximale Anzahl der Mounts zwischen Überprüfungen
    tune2fs -c $max_mounts $fs
    
    # Setze das Intervall für Überprüfungen (in Monaten)
    tune2fs -i ${check_interval}m $fs
done

echo "Alle Dateisysteme wurden konfiguriert."
