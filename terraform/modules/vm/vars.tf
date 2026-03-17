# Variables injectadas desde el main.main
variable "tag" {
  type = string
}

#Variables injectadas del modulo resources
variable "rg_location" {
  type = string
}
variable "rg_name" {
  type = string
}

#Variables injectadas del modulo network
variable "nic_id" {
  type = string
}

#Variables injectadas del modulo storage
variable "storagebd_primary_blob_endpoint" {
  type = string
}

# Variables sensibles
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


# Variables para la creación de la Maquina Virtual y sus componentes
variable "vm_name" {
  description = "Nombre de la máquina virtual a crear"
  type        = string
  default     = "vmcp2"
}
variable "vm_size" {
  description = "Tipo o tamaño de la máquina virtual"
  type        = string
  default     = "Standard_B2s_v2"
}
variable "ssh_alg" {
  description = "Algoritmo para la generacion del par SSH para la autenticación en la máquina virtual"
  type        = string
  default     = "RSA"
}
variable "ssh_bits" {
  description = "Número de bits para la generación del par SSH"
  type        = number
  default     = 4096
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
