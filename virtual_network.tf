resource "azurerm_virtual_network" "vnet" {
  address_space        = [var.vnetAddressPrefix]
  name                 = "vnet"
  location             = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.location
  resource_group_name  = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
  ddos_protection_plan = azurerm_network_ddos_protection_plan.ddos_protection_plan
}

resource "azurerm_network_ddos_protection_plan" "ddos_protection_plan" {
  name                = "ddos_protection_plan"
  location            = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.location
  resource_group_name = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
}
