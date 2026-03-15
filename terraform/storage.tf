resource "azurerm_storage_account" "sabd" {
  name                     = var.sabd_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.sabd_cat
  account_replication_type = var.sabd_reply_type

  tags = {
    environment = var.tag
  }
}