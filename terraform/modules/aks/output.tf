output "aks_client_certificate" {
  description = "Certificado cliente para autenticación en el cluster AKS"
  value     = azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate
  sensitive = true
}
output "aks_kube_config_raw" {
  description = "Credenciales del cluster AKS en formato kubeconfig"
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}