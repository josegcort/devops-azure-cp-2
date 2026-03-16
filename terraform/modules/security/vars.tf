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

#Variables injectadas del modulo network
variable "nic_id" {
  type = string
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
