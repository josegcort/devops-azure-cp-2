# Variables injectadas desde el main.main
variable "tag" {
  type        = string
}


#Variables generales para la creación de recursos en Azure
variable "location" {
  description = "Region de Azure donde se desplegarán los recursos"
  type        = string
  default     = "chilecentral"
}

# Variables para la creación del ResourceGroup
variable "rg_name" {
  description = "Nombre del ResourceGroup principal donde se desplegarán los recursos"
  type        = string
  default     = "rgcp2"
}