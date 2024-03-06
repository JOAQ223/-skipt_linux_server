#!/bin/bash

# YouTube's domain
domain="youtube.com"


# Versuche, die IPv6-Adresse aufzulösen 
ipv6_address=$(getent aaaa ${domain})
#für die Konfiguration Ihrer Netzwerk-Präferenzen schauen SIe die    /etc/gai.conf
if [ -z "$ipv6_address" ]; then
    echo "Keine IPv6-Adresse für ${domain} gefunden. Stellen Sie sicher, dass Ihr Netzwerk IPv6 unterstützt."
else
    echo "IPv6-Adresse für ${domain} gefunden: $ipv6_address"
    echo "Ihr System ist bereits so konfiguriert, dass es IPv6 verwendet, wenn es verfügbar ist."
fi
