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

#Variables injectadas del modulo acr
variable "acr_id" {
  type = string
}


# Variables para la creación del clúster de Kubernetes
variable "aks_name" {
  description = "Nombre del clúster de Kubernetes a crear"
  type        = string
  default     = "akscp2"
}
variable "aks_size" {
  description = "Tipo o tamaño del nodo en el clúster de Kubernetes"
  type        = string
  default     = "Standard_B2s_v2"
}
variable "aks_sku" {
  description = "Variante del clúster de Kubernetes"
  type        = string
  default     = "Free"
}
variable "aks_identity" {
  description = "Tipo de identidad del clúster de Kubernetes"
  type        = string
  default     = "SystemAssigned"
}
variable "aks_role_access" {
  description = "Tipo de acceso de rol del clúster de Kubernetes"
  type        = bool
  default     = true
}
variable "nodo_name" {
  description = "Nombre del nodo en el clúster de Kubernetes"
  type        = string
  default     = "default"
}
variable "node_count" {
  description = "Número de nodos en el clúster de Kubernetes"
  type        = number
  default     = 1
}
variable "role_name" {
  description = "Nombre del rol en el clúster de Kubernetes"
  type        = string
  default     = "AcrPull"
}
variable "role_skip" {
  description = "No verifica si el principal existe aun en Azure"
  type        = bool
  default     = true
}