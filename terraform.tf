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
    resource_group_name  = "fortinet-secure-cloud-blueprint-terraform-tfstate"
    storage_account_name = "fortinetsecurecloudbluep"
    container_name       = "fortinet-secure-cloud-blueprint-terraform-main"
    subscription_id      = "cf72478e-c3b0-4072-8f60-41d037c1d9e9"
    tenant_id            = "942b80cd-1b14-42a1-8dcf-4b21dece61ba"
  }

}

