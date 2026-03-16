# Variables injectadas desde el main.main
variable "tag" {
  type        = string
}

#Variables injectadas del modulo resources
variable "rg_location" {
  type = string
}
variable "rg_name" {
  type = string
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
  default     = "Static"
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