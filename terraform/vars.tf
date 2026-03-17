# Credenciales para la autenticación con Azure
variable "subscription_id" {
  description = "SubscriptionId de Azure para autenticar el proveedor"
  type        = string
  sensitive   = true
}

#Variables generales para la creación de recursos en Azure
variable "tag" {
  description = "Valor de la etiqueta para los recursos a crear"
  type        = string
  default     = "casopractico2"
}

#Variables sensibles para el modulo vm
#Credenciales para la autenticación del usuario de la VM
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