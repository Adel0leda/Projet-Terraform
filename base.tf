# Configuration du provider
provider "azurerm" {
  version = "=2.4.0"

  subscription_id = var.azure_subscription_id
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
  tenant_id       = var.azure_tenant_id

  features{}
}

# Create a resource group
resource "azurerm_resource_group" "RG1" {
  name     = var.rgName
  location = var.region
  tags = {
        environment =  var.tag
    }
}
