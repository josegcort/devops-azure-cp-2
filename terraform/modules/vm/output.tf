output "vm_private_key_pem" {
  description = "Llave privada SSH para acceder a la VM"
  value       = tls_private_key.sshkey.private_key_pem
  sensitive   = true
}
output "vm_username" {
  description = "Nombre de usuario para acceder a la VM"
  value       = var.vm_username
  sensitive   = true
}
