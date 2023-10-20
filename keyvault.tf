#data "azurerm_storage_account" "storage_account" {
#  name                = var.AZURE_STORAGE_ACCOUNT_NAME
#  resource_group_name = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
#}

#output "storage_account_tier" {
#  description = "Storage account tier"
#  value       = data.azurerm_storage_account.storage_account.account_tier
#}

#data "azurerm_client_config" "current" {}
resource "random_string" "azurerm_key_vault_name" {
  length  = 13
  lower   = true
  numeric = false
  special = false
  upper   = false
}
#locals {
#  current_user_id = coalesce(var.msi_id, data.azurerm_client_config.current.object_id)
#}
resource "azurerm_monitor_diagnostic_setting" "example" {
  name               = "example"
  target_resource_id = azurerm_key_vault.vault.id
  storage_account_id = var.AZURE_STORAGE_ACCOUNT_ID

  enabled_log {
    category = "AuditEvent"
    #enabled  = false

    #retention_policy {
    #  enabled = false
    #}
  }

  metric {
    category = "AllMetrics"

    #retention_policy {
    #  enabled = false
    #}
  }
}
resource "azurerm_key_vault" "vault" {
  name                        = coalesce(var.vault_name, "vault-${random_string.azurerm_key_vault_name.result}")
  location                    = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.location
  resource_group_name         = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
  tenant_id                   = var.ARM_TENANT_ID
  sku_name                    = var.sku_name
  enabled_for_disk_encryption = true
  purge_protection_enabled    = true
  soft_delete_retention_days  = 7

  access_policy {
    tenant_id = var.ARM_TENANT_ID
    object_id = azurerm_network_security_group.nsg.id

    key_permissions     = var.key_permissions
    secret_permissions  = var.secret_permissions
    storage_permissions = var.storage_permissions

  }
  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
  }
}
resource "random_string" "azurerm_key_vault_key_name" {
  length  = 13
  lower   = true
  numeric = false
  special = false
  upper   = false
}

resource "azurerm_key_vault_key" "key" {
  name = coalesce(var.key_name, "key-${random_string.azurerm_key_vault_key_name.result}")

  key_vault_id    = azurerm_key_vault.vault.id
  key_type        = "RSA-HSM"
  key_size        = var.key_size
  key_opts        = var.key_ops
  expiration_date = "2025-12-31T00:00:00Z"

  rotation_policy {
    automatic {
      time_before_expiry = "P30D"
    }

    expire_after         = "P90D"
    notify_before_expiry = "P29D"
  }
}

resource "azurerm_disk_encryption_set" "en_set" {
  provider            = azurerm
  name                = "des-01"
  location            = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.location
  resource_group_name = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
  key_vault_key_id    = azurerm_key_vault_key.key.id

  identity {
    type = "SystemAssigned"
  }

}
resource "azurerm_key_vault_access_policy" "kv_access_policy_des" {
  provider     = azurerm
  key_vault_id = azurerm_key_vault.vault.id
  tenant_id    = var.ARM_TENANT_ID
  object_id    = azurerm_disk_encryption_set.en_set.identity[0].principal_id

  key_permissions = [
    "Get",
    "WrapKey",
    "UnwrapKey"
  ]
}

variable "vault_name" {
  type        = string
  description = "The name of the key vault to be created. The value will be randomly generated if blank."
  default     = ""
}

variable "key_name" {
  type        = string
  description = "The name of the key to be created. The value will be randomly generated if blank."
  default     = ""
}

variable "sku_name" {
  type        = string
  description = "The SKU of the vault to be created."
  default     = "standard"
  validation {
    condition     = contains(["standard", "premium"], var.sku_name)
    error_message = "The sku_name must be one of the following: standard, premium."
  }
}

variable "key_permissions" {
  type        = list(string)
  description = "List of key permissions."
  default     = ["List", "Create", "Delete", "Get", "Purge", "Recover", "Update", "GetRotationPolicy", "SetRotationPolicy"]
}

variable "secret_permissions" {
  type        = list(string)
  description = "List of secret permissions."
  default     = ["Set"]
}
variable "storage_permissions" {
  type        = list(string)
  description = "List of secret permissions."
  default     = ["Get"]
}

variable "key_type" {
  description = "The JsonWebKeyType of the key to be created."
  default     = "RSA"
  type        = string
  validation {
    condition     = contains(["EC", "EC-HSM", "RSA", "RSA-HSM"], var.key_type)
    error_message = "The key_type must be one of the following: EC, EC-HSM, RSA, RSA-HSM."
  }
}

variable "key_ops" {
  type        = list(string)
  description = "The permitted JSON web key operations of the key to be created."
  default     = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]
}

variable "key_size" {
  type        = number
  description = "The size in bits of the key to be created."
  default     = 2048
}

output "azurerm_key_vault_name" {
  description = "Name of the Azure key vault"
  value       = azurerm_key_vault.vault.name
}

output "azurerm_key_vault_id" {
  description = "ID of the Azure key vault"
  value       = azurerm_key_vault.vault.id
}
