# Credenciales para autenticación con Azure
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
variable "tag_value" {
  description = "Valor de la etiqueta para los recursos a crear"
  type        = string
  default     = "casopractico2"
}

# Variables para ResourceGroup
variable "rg_name" {
  description = "Nombre del ResourceGroup principal donde se desplegarán los recursos"
  type        = string
  default     = "rg_cp2"
}