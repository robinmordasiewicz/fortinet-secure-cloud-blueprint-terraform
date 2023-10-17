provider "azurerm" {
  features { # after version 2.0 this is mandatory
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}
