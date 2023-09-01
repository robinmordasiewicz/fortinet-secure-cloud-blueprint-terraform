data "azuread_client_config" "current" {}

data "azurerm_client_config" "current" {}

data "azuread_user" "current" {
  object_id = data.azurerm_client_config.current.object_id
}

output "object_id" {
  value = data.azurerm_client_config.current.object_id
}

output "user_principal_name" {
  value = data.azuread_user.current.user_principal_name
}

output "display_name" {
  value = data.azuread_user.current.display_name
}

output "mail" {
  value = data.azuread_user.current.mail
}
