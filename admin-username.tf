resource "random_pet" "admin_username" {
  keepers = {
    resource_group_name = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
  }
}
resource "random_password" "admin_password" {
  keepers = {
    resource_group_name = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
  }
  length      = 8
  min_lower   = 1
  min_special = 1
  min_upper   = 1
}
output "admin_username" {
  value = random_pet.admin_username.id
}
output "admin_password" {
  value     = random_password.admin_password.result
  sensitive = true
}
