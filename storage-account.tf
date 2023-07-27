# Generate random text for a unique storage account name
resource "random_id" "random_id" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = azurerm_resource_group.resource-group.name
  }

  byte_length = 8
}

resource "azurerm_storage_account" "storage-account" {
  account_kind             = "Storage"
  account_replication_type = "LRS"
  account_tier             = "Standard"
  name                     = "diag${random_id.random_id.hex}"
  location                 = azurerm_resource_group.resource-group.location
  resource_group_name      = azurerm_resource_group.resource-group.name
}

#resource "azurerm_storage_container" "storage-container" {
#  name                 = "storage-container"
#  storage_account_name = azurerm_storage_account.storage-account.name
#}
