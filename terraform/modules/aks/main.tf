#Declaracion del cluster de Kubernetes
resource "azurerm_kubernetes_cluster" "aks" {
  name                              = var.aks_name
  location                          = var.rg_location
  resource_group_name               = var.rg_name
  dns_prefix                        = var.aks_name
  sku_tier                          = var.aks_sku
  role_based_access_control_enabled = var.aks_role_access

  default_node_pool {
    name       = var.nodo_name
    node_count = var.node_count
    vm_size    = var.aks_size
  }

  identity {
    type = var.aks_identity
  }

  tags = {
    environment = var.tag
  }
}

resource "azurerm_role_assignment" "acrpull" {
  scope                            = var.acr_id
  role_definition_name             = var.role_name
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  skip_service_principal_aad_check = var.role_skip

}
