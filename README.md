# Caso Practico 2

**Programa:** DevOps & Cloud  
**Autor:** Jose Gabriel Cortazar Ocampo

---

## Descripción

Este repositorio contiene dos componentes principales:

- **Terraform** — Declara y gestiona la infraestructura de recursos en Azure.
- **Ansible** — Configura los recursos creados en Azure por Terraform.

Ambos componentes se integran mediante scripts de automatización que orquestan el flujo completo de despliegue.

---

## Estructura del repositorio

```
.
.
├── 0run_casopractico2.sh         # Script principal. Orquesta la ejecución completa del despliegue en orden.
├── 1run_terraform.sh             # Ejecuta terraform init + plan + apply para aprovisionar la infraestructura en Azure.
├── 2init_ansible.sh              # Prepara el entorno de Ansible, desde los outputs de Terraform genera el inventario dinámico (inventory.ini), la clave ssh (vm.pem), la configuración para kubectl (kubeconfig).
├── 3run_ansible.sh               # Lanza el playbook principal de Ansible. Requiere sudo.
├── 4show_ansible_report.sh       # Muestra el contenido del reporte de IPs públicas generado por Ansible.
│
├── ansible/
│   ├── group_vars/
│   │   └── all.yml               # Variables globales para Ansible
│   ├── inventory.ini             # Inventario de hosts generado dinámicamente con las IPs de los recursos de Azure. (.gitignore)
│   ├── kubeconfig                # Archivo de configuración de kubectl para conectarse al clúster AKS. (.gitignore)
│   ├── playbook.yml              # Playbook principal. Llama a los roles en el orden correcto.
│   ├── report_ips.txt            # Reporte generado con las IPs y recursos expuestos públicamente. (.gitignore)
│   ├── vm.pem                    # Clave privada SSH para conectarse a la máquina virtual de Azure. (.gitignore)
│   │
│   └── roles/
│       ├── common/               # Rol con tareas compartidas y reutilizables por otros roles.
│       │   └── tasks/
│       │       ├── install_podman.yml      # Instala Podman en el host para construir y gestionar contenedores. (Se usa los roles ACR y VM)
│       │       └── acr_login.yml           # Autentica Podman contra Azure Container Registry. (Se usa los roles ACR y VM)
│       │
│       │
│       ├── acr/                  # Rol para gestionar Azure Container Registry (ACR).
│       │   ├── dockerfiles/      # Dockerfiles de las imágenes que se construyen y publican en ACR.
│       │   │   ├── backendcp2/
│       │   │   │   └── Dockerfile          # Imagen del servicio backend de la aplicación.
│       │   │   ├── nginxcp2/
│       │   │   │   ├── Dockerfile          # Imagen de Nginx como servidor/proxy frontal.
│       │   │   │   └── index.html          # Página HTML servida por Nginx.
│       │   │   └── postgrescp2/
│       │   │       └── Dockerfile          # Imagen de PostgreSQL.
│       │   └── tasks/
│       │       ├── main.yml                # Tarea principal del rol: ejecuta las tareas del role common (install_podman, acr_login), seguido coordina el build y push de imágenes dinamicamente.
│       │       └── push_images.yml         # Construye dinamicamente las imágenes con Podman y las publica en ACR.
│       │
│       │
│       ├── aks/                  # Rol para desplegar y configurar recursos dentro del clúster AKS.
│       │   └── tasks/
│       │       ├── main.yml                # Tarea principal del rol AKS: llama al resto de tareas (install_pip, namespace, secret_acr, deploy_postgres, deploy_backend).
│       │       ├── install_pip.yml         # Instala dependencias de Python necesarias para los módulos de Kubernetes.
│       │       ├── namespace.yml           # Crea el namespace de Kubernetes para el proyecto.
│       │       ├── secret_acr.yml          # Crea el secret de Kubernetes con las credenciales de ACR privado.
│       │       ├── deploy_postgres.yml     # Aplica las tareas secret, pvc, deployment, service de PostgreSQL en el clúster.
│       │       ├── secret_postgres.yml     # Crea el secret con las credenciales de PostgreSQL.
│       │       ├── pvc_postgres.yml        # Define el PersistentVolumeClaim para la persistencia de PostgreSQL.
│       │       ├── deployment_postgres.yml # Despliega el contenedor de PostgreSQL.
│       │       ├── service_postgres.yml    # Manifiesto del Service de PostgreSQL (acceso interno).
│       │       ├── deploy_backend.yml      # Aplica las tareas secret, deployment, service del backend en el clúster.
│       │       ├── secret_backend.yml      # Crea el secret con las variables de entorno del backend.
│       │       ├── deployment_backend.yml  # Manifiesto Kubernetes del Deployment del backend.
│       │       └── service_backend.yml     # Manifiesto del Service del backend (LoadBalancer público).
│       │
│       │
│       ├── vm/                   # Rol para configurar la máquina virtual de Azure
│       │    └── tasks/
│       │        ├── main.yml                # Tarea principal del rol VM, ejecuta las tareas del role common (install_podman, acr_login), seguido de deploy_container dinamico.
│       │        └── deploy_container.yml   # Despliega un contenedor directamente en la VM via Podman.
│       │
│       │
│       └── report/               # Rol para recolectar y reportar los recursos expuestos públicamente.
│           └── tasks/
│               ├── main.yml                # Tarea principal del rol: llama a la tarea get_public_ips.
│               └── get_public_ips.yml      # Obtiene las IPs públicas de los servicios y genera un report_ips.txt.
│        
│
├── README.md                     # Documentación principal del proyecto.
│
└── terraform/
    ├── provider.tf               # Configura el proveedor de Azure (AzureRM) y la versión de Terraform.
    ├── main.tf                   # Punto de entrada principal: instancia todos los módulos.
    ├── vars.tf                   # Declara las variables de entrada del proyecto.
    ├── terraform.tfvars          # Valores concretos de las variables, incluidas las sensibles. (.gitignore)
    ├── terraform.tfvars.example  # Plantilla de ejemplo de terraform.tfvars ya que no esta en el repo.
    ├── outputs.tf                # Declara los outputs exportados al outputs.json al finalizar el apply.
    ├── outputs.json              # Outputs del último apply, usados por Ansible para generar el inventario. (.gitignore)
    ├── terraform.tfstate         # Estado actual de la infraestructura gestionada por Terraform. (.gitignore)
    ├── terraform.tfstate.backup  # Copia de seguridad del estado anterior. (.gitignore)
    │
    └── modules/
        ├── resources/            # Módulo que provisiona el Resource Group base de Azure.
        │   ├── main.tf           # Define el Resource Group contenedor de todos los recursos.
        │   ├── output.tf         # Exporta el nombre y ubicación del Resource Group para otros módulos.
        │   └── vars.tf           # Variables del módulo (nombre, región...).
        │
        ├── acr/                  # Módulo que provisiona Azure Container Registry.
        │   ├── main.tf           # Recurso ACR y configuración.
        │   ├── output.tf         # Exporta login server y credenciales del ACR para otros módulos.
        │   └── vars.tf           # Variables del módulo (nombre, SKU, rg, región...).
        │
        ├── aks/                  # Módulo que provisiona el clúster Azure Kubernetes Service.
        │   ├── main.tf           # Recurso AKS, node pool y configuración del clúster.
        │   ├── output.tf         # Exporta kubeconfig y datos del clúster para otros módulos.
        │   └── vars.tf           # Variables del módulo (tamaño de nodos, aks_size, SKU...).
        │
        ├── network/              # Módulo que provisiona los recursos de redes.
        │   ├── main.tf           # Configuración de red, la red virtual VNet, subnets, NIC, IP publica.
        │   ├── output.tf         # Exporta la IP publica, IDs de VNet, subnets, NIC para otros módulos.
        │   └── vars.tf           # Variables del módulo (rangos de IPs, nombres, etc).
        │
        ├── security/             # Módulo que gestiona los Network Security Groups (NSG).
        │   ├── main.tf           # Define las reglas de seguridad de red (puertos, protocolos).
        │   ├── output.tf         # Exporta el ID del grupo para otros módulos.
        │   └── vars.tf           # Variables del módulo (puertos permitidos, nombre...).
        │
        ├── storage/              # Módulo que provisiona una cuenta de almacenamiento en Azure.
        │   ├── main.tf           # Recurso Storage Account y contenedor de blobs.
        │   ├── output.tf         # Exporta el ID del strorage para otros módulos.
        │   └── vars.tf           # Variables del módulo (nombre, tipo de replicación...).
        │
        └── vm/                   # Módulo que provisiona la máquina virtual Linux en Azure.
            ├── main.tf           # Recurso VM y configuración de SO.
            ├── output.tf         # Exporta el nombre del usuario y la clave privada SSH de la VM.
            └── vars.tf           # Variables del módulo (tamaño, imagen, usuario...).
```

---

## Script principal

El despliegue completo se orquesta mediante el script `0run_casopractico2.sh`:

```bash
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

# Mostrar el reporte de los recursos expuestos públicamente por Ansible
echo "Step 4: Show ansible report..."
./4show_ansible_report.sh

echo "El despliegue del CasoPractico2 ha sido completado con éxito."
```

### Pasos del flujo

| Paso | Script | Descripción |
|------|--------|-------------|
| 1 | `1run_terraform.sh` | Aprovisiona la infraestructura en Azure |
| 2 | `2init_ansible.sh` | Prepara el entorno de Ansible |
| 3 | `3run_ansible.sh` | Configura los recursos (requiere `sudo`) |
| 4 | `4show_ansible_report.sh` | Muestra los recursos expuestos públicamente |

---

## Uso

```bash
# Dar permisos de ejecución a los scripts
chmod +x *.sh

# Ejecutar el despliegue completo
./0run_casopractico2.sh
```

> **Nota:** Solo el paso 3 (`3run_ansible.sh`) requiere privilegios de superusuario. El script principal lo invoca con `sudo` internamente, por lo que **no es necesario** ejecutar `0run_casopractico2.sh` como root.

---

## Requisitos previos

- [Terraform](https://developer.hashicorp.com/terraform/install) instalado y configurado.
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html) instalado.
- Credenciales de Azure configuradas (mediante Azure CLI o variables de entorno).
- [jp](https://installati.one/install-jp-ubuntu-20-04/) instalado.
- Permisos de `sudo` para el usuario que ejecuta el despliegue.