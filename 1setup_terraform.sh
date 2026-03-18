#!/bin/bash

# Salir inmediatamente si un comando falla
set -e

# Definir la ruta de la carpeta
TERRAFORM_DIR="./terraform"

# Entrar a la carpeta (si falla, el script se detiene)
if [ -d "$TERRAFORM_DIR" ]; then
    pushd "$TERRAFORM_DIR" > /dev/null
else
    echo "Error: El directorio $TERRAFORM_DIR no existe."
    exit 1
fi

# Ejecución secuencial para el despliegue de la infraestructura usando Terraform
echo "Step 1: terraform init..."
terraform init

echo "Step 2: terraform plan..."
terraform plan -var-file="terraform.tfvars"

echo "Step 3: terraform apply..."
terraform apply -auto-approve

echo "Step 4: Generando outputs.json..."
terraform output -json > outputs.json

# Volver a la carpeta original
popd > /dev/null

echo "Terraform completado con éxito. El archivo outputs.json está listo."