# Definición del Security Group
resource "azurerm_network_security_group" "secgroup" {
  name                = var.secgroup_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = var.rule_prot1_name
    priority                   = var.rule_prot1_priority
    direction                  = var.rule_type_in
    access                     = var.rule_access_allow
    protocol                   = var.rule_prot
    source_port_range          = var.rule_allow_all
    destination_port_range     = var.rule_prot1_port
    source_address_prefix      = var.rule_allow_all
    destination_address_prefix = var.rule_allow_all
  }
  security_rule {
    name                       = var.rule_prot2_name
    priority                   = var.rule_prot2_priority
    direction                  = var.rule_type_in
    access                     = var.rule_access_allow
    protocol                   = var.rule_prot
    source_port_range          = var.rule_allow_all
    destination_port_range     = var.rule_prot2_port
    source_address_prefix      = var.rule_allow_all
    destination_address_prefix = var.rule_allow_all
  }

  tags = {
    environment = var.tag
  }
}

resource "azurerm_network_interface_security_group_association" "vnetassosecgroup" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.secgroup.id
}
