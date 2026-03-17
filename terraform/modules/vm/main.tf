# Definición de par SSH para acceso seguro a la VM.
resource "tls_private_key" "sshkey" {
  algorithm = var.ssh_alg
  rsa_bits  = var.ssh_bits
}

# Definición de la máquina virtual Linux
resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = var.rg_name
  location            = var.rg_location
  size                = var.vm_size
  admin_username      = var.vm_username
  admin_password      = var.vm_password
  network_interface_ids = [
    var.nic_id,
  ]

  # Configuración de la clave SSH para la autenticación en la máquina virtual
  admin_ssh_key {
    username   = var.vm_username
    public_key = tls_private_key.sshkey.public_key_openssh
  }

  # Configuración del disco del sistema operativo de la máquina virtual
  os_disk {
    name                 = var.osdisk_name
    caching              = var.osdisk_ch
    storage_account_type = var.osdisk_type
  }

  # Configuración de la imagen del sistema operativo de la máquina virtual
  source_image_reference {
    publisher = var.os_pub
    offer     = var.os_offer
    sku       = var.os_sku
    version   = var.os_version
  }

  # Configuración de diagnósticos de arranque para la máquina virtual, utilizando una cuenta de almacenamiento creada previamente
  boot_diagnostics {
    storage_account_uri = var.storagebd_primary_blob_endpoint
  }

  tags = {
    environment = var.tag
  }
}
