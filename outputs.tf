output "availabilitySetName" {
  description = "Name of the Azure availability set."
  value       = azurerm_availability_set.fortinet_availability_set.name
}
output "availabilitySetId" {
  description = "ID of the Azure availability set."
  value       = azurerm_availability_set.fortinet_availability_set.id
}

output "availabilitySetFdc" {
  description = "Number of fault domains in the availability set."
  value       = azurerm_availability_set.fortinet_availability_set.platform_fault_domain_count
}

output "ubuntuVmName" {
  description = "Ubuntu machine name."
  value       = azurerm_linux_virtual_machine.ubuntu_virtual_machine.name
}

output "resourceGroupName" {
  description = "Azure resource group for all objects"
  value       = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
}

output "currentSubscriptionDisplayName" {
  description = "Azure subscription Name"
  value       = data.azurerm_subscription.current.display_name
}
output "currentSubscriptionId" {
  description = "Azure subscription ID"
  value       = data.azurerm_subscription.current.id
}
