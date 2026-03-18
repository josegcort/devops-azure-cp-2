#!/bin/bash

# Salir inmediatamente si un comando falla
set -e

# Definir la ruta de la carpeta
PATH_ANSIBLE_REPORT="./ansible/report_ips.txt"

# Verificar si el archivo report_ips.txt existe
if [ -f "$PATH_ANSIBLE_REPORT" ]; then
    echo "Ansible generó el reporte de los recursos expuestos publicamente"
    echo "Reporte de las direcciones IP públicas de $PATH_ANSIBLE_REPORT:"
    cat "$PATH_ANSIBLE_REPORT"
else
    echo "Error: No se encuentra $PATH_ANSIBLE_REPORT. Ejecuta el script de Ansible primero ...'"
    exit 1
fi
