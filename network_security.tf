resource "azurerm_network_security_group" "nsg" { #tfsec:ignore:azure-network-no-public-ingress
  #checkov:skip=CKV_AZURE_160: Port 80 and 443 are open the internet
  name                = "nsg"
  location            = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.location
  resource_group_name = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name

  security_rule {
    name                       = "allow_http-https_tcp"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["80", "443"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
