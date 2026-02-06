#!/usr/bin/env bash

echo "nombre del equipo"
hostname
echo ""
echo "IP actual"
hostname -I | awk '{print $2}'
echo "Espacio en disco"
df -h / | awk 'NR==1 || NR==2'
