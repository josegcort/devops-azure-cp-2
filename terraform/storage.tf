# Definición del Storage Account a crear en Azure para el boot diagnostics de la máquina virtual
resource "azurerm_storage_account" "storagebd" {
  name                     = var.storagebd_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.storagebd_cat
  account_replication_type = var.storagebd_reply_type

  tags = {
    environment = var.tag
  }
}