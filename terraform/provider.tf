terraform {
  # azurerm provider es usado para interactuar con los recursos de Azure
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.64.0"
    }
  }
}

# Configuración del proveedor de Azure
provider "azurerm" {
    features {}
    #configuración de autenticación usando la SubscriptionId proporcionada como variable sensible
    subscription_id = var.subscription_id
}