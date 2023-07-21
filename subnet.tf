resource "azurerm_subnet" "external-subnet" {
  address_prefixes     = ["${var.external-Prefix}"]
  name                 = var.external-Name
  resource_group_name  = azurerm_resource_group.resource-group.name
  virtual_network_name = azurerm_virtual_network.vnet.name
}
resource "azurerm_subnet" "dmz-subnet" {
  address_prefixes     = ["${var.dmz-Prefix}"]
  name                 = var.dmz-Name
  resource_group_name  = azurerm_resource_group.resource-group.name
  virtual_network_name = azurerm_virtual_network.vnet.name
}
resource "azurerm_subnet" "internal-subnet" {
  address_prefixes     = ["${var.internal-Prefix}"]
  name                 = var.internal-Name
  resource_group_name  = azurerm_resource_group.resource-group.name
  virtual_network_name = azurerm_virtual_network.vnet.name
}
