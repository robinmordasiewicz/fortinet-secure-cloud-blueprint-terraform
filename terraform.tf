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
    key                  = "fortinet-secure-cloud-blueprint-terraform-main.tfstate"
    resource_group_name  = "fortinet-secure-cloud-blueprint-terraform-main-tfstate"
    storage_account_name = "fscbmain"
    container_name       = "main-container"
    use_oidc             = true
    use_azuread_auth     = true
  }
}
