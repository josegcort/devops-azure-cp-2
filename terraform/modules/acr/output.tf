output "acr_id" {
  description = "Id del Container Registry"
  value = azurerm_container_registry.acr.id
}
output "acr_login_server" {
  description = "URL del Container Registry"
  value = azurerm_container_registry.acr.login_server
}
output "acr_admin_username" {
  description = "Usuario administrador del Container Registry"
  value       = azurerm_container_registry.acr.admin_username
  sensitive   = true
}
output "acr_admin_password" {
  description = "Contraseña del administrador del Container Registry"
  value       = azurerm_container_registry.acr.admin_password
  sensitive   = true
}