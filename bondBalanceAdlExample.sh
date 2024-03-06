#!/bin/bash
# skript for example mit bond mit balance-adl
# Überprüfen, ob das Skript als root ausgeführt wird
if [ "$(id -u)" -ne 0 ]; then
  echo "Dieses Skript muss als root ausgeführt werden" >&2
  exit 1
fi

# Bonding-Modul laden
modprobe bonding

# Bonding-Interface konfigurieren, falls noch nicht vorhanden
if ! grep -q 'bond0' /proc/net/bonding/bond0 2>/dev/null; then
  echo "+ Erstelle bond0 Interface"
  ip link add bond0 type bond
  ip link set bond0 type bond mode balance-alb miimon=100
else
  echo "bond0 existiert bereits."
fi

# Physische Interfaces zum Bond hinzufügen
echo "+ Füge eth0 und eth1 zu bond0 hinzu"
ifenslave bond0 eth0 eth1

# IP-Konfiguration für bond0 setzen
echo "+ Setze IP-Konfiguration für bond0"
ip addr add 192.168.1.10/24 dev bond0
ip link set dev bond0 up
ip route add default via 192.168.1.1

echo "Bonding-Konfiguration abgeschlossen."

#skript  nbereit zur runnen machen mit chmod +x configure-bonding.sh
# run skript mit sudo ./configure-bonding.sh 