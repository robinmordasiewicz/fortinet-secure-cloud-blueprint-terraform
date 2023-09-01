resource "azurerm_resource_group" "resource-group" {
  location = var.azure_region
  name     = var.resource_group_name
  tags = {
    Username = var.azure_username
  }
}

