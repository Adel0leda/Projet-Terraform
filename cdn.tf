resource "azurerm_cdn_profile" "esgi" {
  name                = "esgi-cdn"
  location            = azurerm_resource_group.RG1.location
  resource_group_name = azurerm_resource_group.RG1.name
  sku                 = "Standard_Microsoft"
}

resource "azurerm_cdn_endpoint" "example" {
  name                = "esgi-cdn-endpoint"
  profile_name        = azurerm_cdn_profile.esgi.name
  location            = azurerm_resource_group.RG1.location
  resource_group_name = azurerm_resource_group.RG1.name

  origin {
    name      = "esgi"
    host_name = "www.terraform-esgi-5SRC2.com"
  }
}
