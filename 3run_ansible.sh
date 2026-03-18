#!/bin/bash

# Salir inmediatamente si un comando falla
set -e

# Definir la ruta de la carpeta
ANSIBLEDIR="./ansible"

# Entrar a la carpeta (si falla, el script se detiene)
if [ -d "$ANSIBLEDIR" ]; then
    pushd "$ANSIBLEDIR" > /dev/null
else
    echo "Error: El directorio $ANSIBLEDIR no existe."
    exit 1
fi

# Ejecución de la configuración de los recursos usando Ansible
echo "Step 1: ejecutando Ansible..."
ansible-playbook -i inventory.ini playbook.yml

# Volver a la carpeta original
popd > /dev/null

echo "Ansible completado con éxito. El archivo report_ips.txt está listo."