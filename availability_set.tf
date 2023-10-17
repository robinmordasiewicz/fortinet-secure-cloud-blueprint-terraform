resource "azurerm_availability_set" "fortinet_availability_set" {
  location                     = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.location
  resource_group_name          = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
  name                         = "fortinet_availability_set"
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2
}
