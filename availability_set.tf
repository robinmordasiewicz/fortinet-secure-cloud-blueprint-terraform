resource "azurerm_availability_set" "fortinet-availability-set" {
  location                     = azurerm_resource_group.resource-group.location
  resource_group_name          = azurerm_resource_group.resource-group.name
  name                         = "fortinet-availability-set"
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2
}
