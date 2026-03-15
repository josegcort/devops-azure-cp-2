# Definición de la red virtual
resource "azurerm_virtual_network" "network" {
  name                = var.vnet_name
  address_space       = [var.vnet_range]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = {
    environment = var.tag
  }
}

# Definición de la subred asociada de la red virtual creada previamente
resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  address_prefixes     = [var.subnet_prefixes]
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.network.name
}

# Creación de la IP pública para la máquina virtual
resource "azurerm_public_ip" "pub_ip" {
  name                = var.pub_ip_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = var.pub_ip_type

  tags = {
    environment = var.tag
  }
}

#  Definición de la interfaz de red para la máquina virtual, asociada a la subred y a una IP pública
resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = var.prv_ip_name
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = var.prv_ip_type
    private_ip_address            = var.prv_ip_address
    public_ip_address_id          = azurerm_public_ip.pub_ip.id
  }
}
