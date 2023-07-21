resource "azurerm_virtual_network" "vnet" {
  address_space       = ["${var.vnetAddressPrefix}"]
  name                = "vnet"
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name
}
