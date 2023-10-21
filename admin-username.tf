resource "random_pet" "admin_username" {
  keepers = {
    resource_group_name = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
  }
}
output "admin_username" {
  description = "Username for admin account"
  value       = random_pet.admin_username.id
}
