terraform {
  required_version = ">=1.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.71.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~>2.41.0"
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
    key = "fortinet-secure-cloud-blueprint-terraform.tfstate"
  }
}
