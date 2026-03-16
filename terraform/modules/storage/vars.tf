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

