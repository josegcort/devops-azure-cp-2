# Definición del Security Group
resource "azurerm_network_security_group" "secgroup" {
  name                = var.secgroup_name
  location            = var.rg_location
  resource_group_name = var.rg_name

  # Reglas de seguridad para permitir el tráfico entrante al puerto 22 (SSH)
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
  # Reglas de seguridad para permitir el tráfico entrante al puerto 80 (HTTP)
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

# Asociación del Security Group a la interfaz de red
resource "azurerm_network_interface_security_group_association" "vnetassosecgroup" {
  network_interface_id      = var.nic_id
  network_security_group_id = azurerm_network_security_group.secgroup.id
}