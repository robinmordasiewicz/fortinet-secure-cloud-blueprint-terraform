resource "azurerm_network_security_group" "private-nsg" {
  name                = "private-nsg"
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name
  security_rule {
    name                       = "block-all-in"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "block-all-out"
    priority                   = 101
    direction                  = "Outbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_subnet_network_security_group_association" "external-subnet-association" {
  subnet_id                 = azurerm_subnet.external-subnet.id
  network_security_group_id = azurerm_network_security_group.private-nsg.id
}
resource "azurerm_subnet_network_security_group_association" "dmz-subnet-association" {
  subnet_id                 = azurerm_subnet.dmz-subnet.id
  network_security_group_id = azurerm_network_security_group.private-nsg.id
}
resource "azurerm_subnet_network_security_group_association" "internal-subnet-association" {
  subnet_id                 = azurerm_subnet.internal-subnet.id
  network_security_group_id = azurerm_network_security_group.private-nsg.id
}

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
