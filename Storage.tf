resource "azurerm_storage_account" "game" {
  name                     = "terraformesgisrc2game"
  resource_group_name      = azurerm_resource_group.RG1.name
  location                 = azurerm_resource_group.RG1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "cdn" {
  name                  = "vhds"
  storage_account_name  = azurerm_storage_account.game.name
  container_access_type = "private"
}
