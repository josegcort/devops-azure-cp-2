# Definición del grupo de recursos a crear en Azure
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
  
  tags = {
    environment = var.tag
  }
}
