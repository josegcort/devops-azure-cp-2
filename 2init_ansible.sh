#!/bin/bash

# Salir inmediatamente si un comando falla
set -e 

# Variables
OUTPUTS_FILE="./terraform/outputs.json"
ANSIBLE_PATH="./ansible"
VM_HOSTNAME="vm"
PATH_SSH="/vm.pem"
PATH_KUBECONFIG="/kubeconfig"
PATH_ENV_PYTHON="/tmp/ansible-venv"

# Validar que exista el archivo de Terraform
if [ ! -f "$OUTPUTS_FILE" ]; then
    echo "Error: No se encuentra $OUTPUTS_FILE. Ejecuta el script de Terraform primero ...'"
    exit 1
fi

# Se obtienen los datos de terraform
VM_PUBLIC_IP=$(jq -r '.vm_public_ip.value' "$OUTPUTS_FILE")
VM_USERNAME=$(jq -r '.vm_username.value' "$OUTPUTS_FILE")
ACR_NAME=$(jq -r '.acr_name.value' "$OUTPUTS_FILE")
ACR_LOGIN_SERVER=$(jq -r '.acr_login_server.value' "$OUTPUTS_FILE")
ACR_ADMIN_USERNAME=$(jq -r '.acr_admin_username.value' "$OUTPUTS_FILE")
ACR_ADMIN_PASSWORD=$(jq -r '.acr_admin_password.value' "$OUTPUTS_FILE")

# Actualiza el archivo hosts para identificar la VM_PUBLIC_IP con VM_HOSTNAME
echo "Actualizando /etc/hosts..."

# Elimina cualquier línea que apunte a VM_HOSTNAME 
sudo sed -i "/ $VM_HOSTNAME$/d" /etc/hosts

# Agrega la nueva IP apuntando a VM_HOSTNAME
echo "$VM_PUBLIC_IP $VM_HOSTNAME" | sudo tee -a /etc/hosts > /dev/null

echo "Archivo hosts actualizado: $VM_PUBLIC_IP ahora es '$VM_HOSTNAME'"

# Crea el directorio de ansible si no existe
mkdir -p "$ANSIBLE_PATH"

# Genera el archivo de clave privada para Ansible
echo "Generando archivo con la clave privada..."
jq -r '.vm_private_key_pem.value' "$OUTPUTS_FILE" > "$ANSIBLE_PATH$PATH_SSH"
chmod 600 "$ANSIBLE_PATH$PATH_SSH"

# Genera el archivo de configuración de Kubernetes para Ansible
echo "Generando archivo con la configuración de Kubernetes..."
jq -r '.aks_kube_config_raw.value' "$OUTPUTS_FILE" > "$ANSIBLE_PATH$PATH_KUBECONFIG"

# Generar inventario con variables para Ansible
echo "Creando inventario en $ANSIBLE_PATH/inventory.ini..."
cat > "$ANSIBLE_PATH/inventory.ini" <<EOF
[servers]
$VM_HOSTNAME ansible_user=$VM_USERNAME ansible_ssh_private_key_file=.$PATH_SSH ansible_python_interpreter=/usr/bin/python3 ansible_ssh_extra_args='-o StrictHostKeyChecking=no'
localhost ansible_connection=local ansible_python_interpreter=/usr/bin/python3

[all:vars]
# Variables globales
vm_public_ip=$VM_PUBLIC_IP
vm_hostname=$VM_HOSTNAME
vm_username=$VM_USERNAME
acr_name=$ACR_NAME
acr_login_server=$ACR_LOGIN_SERVER
acr_admin_username=$ACR_ADMIN_USERNAME
acr_admin_password=$ACR_ADMIN_PASSWORD
aks_kubeconfig_path=.$PATH_KUBECONFIG
venv_path=$PATH_ENV_PYTHON
postgres_user=crud
postgres_password=crud*2026
postgres_db=crud

EOF

echo "Creación de la clave ssh y del inventario ($ANSIBLE_PATH/inventory.ini) completados con éxito."