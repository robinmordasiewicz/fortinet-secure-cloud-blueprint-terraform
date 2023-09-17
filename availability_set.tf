resource "azurerm_availability_set" "fortinet-availability-set" {
  location                     = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.location
  resource_group_name          = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
  name                         = "fortinet-availability-set"
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2
}
