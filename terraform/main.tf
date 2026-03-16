#Declaracion del modulo resources
module "resources" {
  source = "./modules/resources"

  # Tag común para todos los recursos
  tag = var.tag
}

#Declaracion del modulo storage
module "storage" {
  source = "./modules/storage"

  # Injecta variables del modulo resources
  rg_location = module.resources.rg_location
  rg_name     = module.resources.rg_name

  # Tag común para todos los recursos
  tag = var.tag
}

#Declaracion del modulo network
module "network" {
  source = "./modules/network"

  # Injecta variables del modulo resources
  rg_location = module.resources.rg_location
  rg_name     = module.resources.rg_name

  # Tag común para todos los recursos
  tag = var.tag
}

#Declaracion del modulo security
module "security" {
  source = "./modules/security"

  # Injecta variables del modulo resources
  rg_location = module.resources.rg_location
  rg_name     = module.resources.rg_name
  nic_id      = module.network.nic_id

  # Tag común para todos los recursos
  tag = var.tag
}

#Declaracion del modulo vm
module "vm" {
  source = "./modules/vm"

  # Injecta variables del modulo resources
  rg_location = module.resources.rg_location
  rg_name     = module.resources.rg_name

  # Injecta variables del modulo network
  nic_id = module.network.nic_id

  # Injecta variables del modulo storage
  storagebd_primary_blob_endpoint = module.storage.storagebd_primary_blob_endpoint

  # Injecta variables de variables sensibles
  vm_username = var.vm_username
  vm_password = var.vm_password

  # Tag común para todos los recursos
  tag = var.tag
}
