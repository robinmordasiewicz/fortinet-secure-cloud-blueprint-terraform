# Generate random text for a unique storage account name
resource "random_id" "random_id" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = azurerm_resource_group.resource-group.name
  }

  byte_length = 8
}

resource "azurerm_storage_account" "storage-account" {
  account_kind                  = "StorageV2"
  account_replication_type      = "LRS"
  account_tier                  = "Premium"
  name                          = "diag${random_id.random_id.hex}"
  location                      = azurerm_resource_group.resource-group.location
  resource_group_name           = azurerm_resource_group.resource-group.name
  public_network_access_enabled = false
  min_tls_version               = "TLS1_2"
  queue_properties {
    logging {
      delete                = true
      read                  = true
      write                 = true
      version               = "1.0"
      retention_policy_days = 10
    }
  }
}

#resource "azurerm_storage_container" "storage-container" {
#  name                 = "storage-container"
#  storage_account_name = azurerm_storage_account.storage-account.name
#}
