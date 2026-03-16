# Credenciales para la autenticación con Azure
variable "subscription_id" {
  description = "SubscriptionId de Azure para autenticar el proveedor"
  type        = string
  sensitive   = true
}

#Variables generales para la creación de recursos en Azure
variable "location" {
  description = "Region de Azure donde se desplegarán los recursos"
  type        = string
  default     = "eastus"
}
variable "tag" {
  description = "Valor de la etiqueta para los recursos a crear"
  type        = string
  default     = "CP2"
}

# Variables para la creación del ResourceGroup
variable "rg_name" {
  description = "Nombre del ResourceGroup principal donde se desplegarán los recursos"
  type        = string
  default     = "rgcp2"
}

# Variables para la creación del Storage Account apara el boot diagnostics
variable "storagebd_name" {
  description = "Nombre del Storage Account a crear"
  type        = string
  default     = "storagebdcp2"
}
variable "storagebd_cat" {
  description = "Categoria del Storage Account a crear"
  type        = string
  default     = "Standard"
}
variable "storagebd_reply_type" {
  description = "Tipo de replicación del Storage Account a crear"
  type        = string
  default     = "LRS"
}

# Variables para la creación de la red virtual
variable "vnet_name" {
  description = "Nombre de la red virtual a crear"
  type        = string
  default     = "vnetcp2"
}
variable "vnet_range" {
  description = "Rango de direcciones de la red virtual a crear"
  type        = string
  default     = "10.0.0.0/16"
}

# Variables para la creación de la subred
variable "subnet_name" {
  description = "Nombre de la subred a crear"
  type        = string
  default     = "subnetcp2"
}
variable "subnet_prefixes" {
  description = "Rango de direcciones de la subred a crear"
  type        = string
  default     = "10.0.1.0/24"
}

# Variables para la dirección IP publica
variable "pub_ip_name" {
  description = "Nombre de la dirección IP publica a crear"
  type        = string
  default     = "pubipcp2"
}
variable "pub_ip_type" {
  description = "Tipo de asignación de la IP publica"
  type        = string
  default     = "Dynamic"
}
variable "pub_ip_sku" {
  description = "Variante de la IP publica"
  type        = string
  default     = "Standard"
}

# Variables para la creación de la NIC
variable "nic_name" {
  description = "Nombre de la interfaz de red a crear"
  type        = string
  default     = "niccp2"
}

# Variables para la dirección IP privada interna en la NIC
variable "prv_ip_name" {
  description = "Nombre de la dirección IP privada interna a asignar a la interfaz de red a crear"
  type        = string
  default     = "prvipcp2"
}
variable "prv_ip_type" {
  description = "Tipo de asignación de la IP privada"
  type        = string
  default     = "Static"
}
variable "prv_ip_address" {
  description = "Dirección de la IP privada"
  type        = string
  default     = "10.0.1.10"
}

# Variables para el Security Group y reglas de seguridad
variable "secgroup_name" {
  description = "Nombre del Security Group a crear"
  type        = string
  default     = "secgroupcp2"
}
variable "rule_prot" {
  description = "Protocolo TCP"
  type        = string
  default     = "Tcp"
}
variable "rule_type_in" {
  description = "Regla de seguridad para tráfico entrante"
  type        = string
  default     = "Inbound"
}
variable "rule_access_allow" {
  description = "Regla de seguridad para permitir el tráfico"
  type        = string
  default     = "Allow"
}
variable "rule_allow_all" {
  description = "Permitir todo en la regla de seguridad *"
  type        = string
  default     = "*"
}
variable "rule_prot1_name" {
  description = "Nombre de la regla de seguridad para SSH a crear"
  type        = string
  default     = "SSH"
}
variable "rule_prot1_port" {
  description = "Puerto de la regla de seguridad para SSH a crear"
  type        = string
  default     = "22"
}
variable "rule_prot1_priority" {
  description = "Prioridad de la regla de seguridad para SSH a crear"
  type        = number
  default     = 1001
}
variable "rule_prot2_name" {
  description = "Nombre de la regla de seguridad para HTTP a crear"
  type        = string
  default     = "WEB"
}
variable "rule_prot2_port" {
  description = "Puerto de la regla de seguridad para HTTP a crear"
  type        = string
  default     = "80"
}
variable "rule_prot2_priority" {
  description = "Prioridad de la regla de seguridad para HTTP a crear"
  type        = number
  default     = 1002
}

# Variables para la creación de la Maquina Virtual y sus componentes
variable "vm_name" {
  description = "Nombre de la máquina virtual a crear"
  type        = string
  default     = "vmcp2"
}
variable "vm_size" {
  description = "Tipo o tamaño de la máquina virtual"
  type        = string
  default     = "Standard_B2ls_v2"
}
variable "vm_username" {
  description = "Nombre del usuario administrador de la máquina virtual"
  type        = string
  sensitive   = true
}
variable "vm_password" {
  description = "Contraseña del usuario administrador de la máquina virtual"
  type        = string
  sensitive   = true
}
variable "ssh_pub_key" {
  description = "Ruta del archivo de clave pública SSH para la autenticación en la máquina virtual"
  type        = string
  default     = "~/.ssh/vm.pub"
}
variable "osdisk_name" {
  description = "Nombre del disco del sistema operativo de la máquina virtual"
  type        = string
  default     = "osdiskcp2"
}
variable "osdisk_ch" {
  description = "Tipo de caché del disco del sistema operativo de la máquina virtual"
  type        = string
  default     = "ReadWrite"
}
variable "osdisk_type" {
  description = "Tipo de almacenamiento del disco del sistema operativo de la máquina virtual"
  type        = string
  default     = "Standard_LRS"
}
variable "os_pub" {
  description = "Editor de la imagen del sistema operativo de la máquina virtual"
  type        = string
  default     = "Canonical"
}
variable "os_version" {
  description = "Versión de la imagen del sistema operativo de la máquina virtual"
  type        = string
  default     = "latest"
}
variable "os_sku" {
  description = "Variante de la imagen del sistema operativo de la máquina virtual"
  type        = string
  default     = "22_04-lts-gen2"
}
variable "os_offer" {
  description = "Distribución de la imagen del sistema operativo de la máquina virtual"
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
}