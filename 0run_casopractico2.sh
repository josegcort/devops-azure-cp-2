#!/bin/bash

# Salir inmediatamente si un comando falla
set -e

# Ejecución del despliegue de la infraestructura usando Terraform
echo "Step 1: Run terraform..."
./1run_terraform.sh

# Preparación de Ansible para la configuración de los recursos
echo "Step 2: Init ansible..."
./2init_ansible.sh

# Ejecución de Ansible para la configuración de los recursos
echo "Step 3: Run ansible..."
sudo ./3run_ansible.sh 

# Mostrar el reporte de los recursos expuestos publicamente por Ansible
echo "Step 4: Show ansible report..."
./4show_ansible_report.sh

echo "El despliegue del CasoPractico2 ha sido completado con éxito."