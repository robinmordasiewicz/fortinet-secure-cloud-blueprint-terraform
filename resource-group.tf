resource "azurerm_resource_group" "resource-group" {
  location = var.AZURE_REGION
  name     = var.AZURE_RESOURCE_GROUP_NAME
  tags = {
    Username = var.AZURE_USERNAME
  }
}

