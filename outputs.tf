output "availability_set_name" {
  description = "Name of the Azure availability set."
  value       = azurerm_availability_set.fortinet-availability-set.name
}
output "availability_set_id" {
  description = "ID of the Azure availability set."
  value       = azurerm_availability_set.fortinet-availability-set.id
}

output "availability_set_fdc" {
  description = "Number of fault domains in the availability set."
  value       = azurerm_availability_set.fortinet-availability-set.platform_fault_domain_count
}

output "vm_name" {
  description = "Ubuntu machine name."
  value       = azurerm_linux_virtual_machine.ubuntu-virtual-machine.name
}

output "resource_group_name" {
  description = "Azure resource group for all objects"
  value       = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
}

output "current_subscription_display_name" {
  description = "Azure subscription Name"
  value       = data.azurerm_subscription.current.display_name
}
output "current_subscription_id" {
  description = "Azure subscription ID"
  value       = data.azurerm_subscription.current.id
}
