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
  default     = "stgbdcp2"
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
  default     = "vnetcp2"
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