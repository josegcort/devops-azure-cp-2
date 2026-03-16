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

# Variables para la creación del Container Registry
variable "acr_name" {
  description = "Nombre del registro de contenedores a crear"
  type        = string
  default     = "acrcp2"
}
variable "acr_sku" {
  description = "Variante del registro de contenedores a crear"
  type        = string
  default     = "Basic"
}
variable "acr_admin" {
  description = "Indica si se debe habilitar el acceso de administrador al registro de contenedores"
  type        = bool
  default     = true
}