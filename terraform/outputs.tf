#Valores de salida del modulo network
output "vm_public_ip" {
  description = "Valor de la direccion IP"
  value       = module.network.pub_ip
}

#Valores de salida del modulo vm
output "vm_private_key_pem" {
  description = "Llave privada SSH para acceder a la VM"
  value       = module.vm.vm_private_key_pem
  sensitive   = true
}
output "vm_username" {
  description = "Nombre de usuario para acceder a la VM"
  value       = module.vm.vm_username
  sensitive   = true
}

#Valores de salida del modulo acr
output "acr_name" {
  description = "Nombre del Container Registry"
  value       = module.acr.acr_name
}
output "acr_login_server" {
  description = "URL del Container Registry"
  value       = module.acr.acr_login_server
}
output "acr_admin_username" {
  description = "Usuario administrador del Container Registry"
  value       = module.acr.acr_admin_username
  sensitive   = true
}
output "acr_admin_password" {
  description = "Contraseña del administrador del Container Registry"
  value       = module.acr.acr_admin_password
  sensitive   = true
}

#Valores de salida del modulo aks
output "client_certificate" {
  description = "Certificado cliente para autenticación en el cluster AKS"
  value       = module.aks.aks_client_certificate
  sensitive   = true
}
output "aks_kube_config_raw" {
  description = "Credenciales del cluster AKS en formato kubeconfig"
  value       = module.aks.aks_kube_config_raw
  sensitive   = true
}
