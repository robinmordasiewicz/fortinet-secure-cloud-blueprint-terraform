terraform {
  required_version = ">=1.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.65.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.5.1"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~>4.0.4"
    }
  }
  backend "azurerm" {
    key = "terraform.tfstate"
    use_oidc = true
    use_azuread_auth = true
    resource_group_name  = "StorageAccount-ResourceGroup"
    storage_account_name = "abcd1234"
    container_name       = "tfstate"
    #subscription_id      = "00000000-0000-0000-0000-000000000000"
    #tenant_id            = "00000000-0000-0000-0000-000000000000"
  }


}

