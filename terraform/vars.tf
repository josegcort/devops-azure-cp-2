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
variable "sabd_name" {
  description = "Nombre del Storage Account a crear"
  type        = string
  default     = "sabdcp2"
}
variable "sabd_cat" {
  description = "Categoria del Storage Account a crear"
  type        = string
  default     = "Standard"
}
variable "sabd_reply_type" {
  description = "Tipo de replicación del Storage Account a crear"
  type        = string
  default     = "LRS"
}
