output "nic_id" {
    value = azurerm_network_interface.nic.id
}
output "pub_ip" {
  value = azurerm_public_ip.pub_ip.ip_address
}