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
    key                  = var.key
    use_oidc             = true
    use_azuread_auth     = true
    resource_group_name  = var.resource_group_name
    storage_account_name = var.storage_account_name
    container_name       = var.container_name
    subscription_id      = var.subscription_id
    tenant_id            = var.tenant_id
  }
}
