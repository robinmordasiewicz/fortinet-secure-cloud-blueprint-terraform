resource "azurerm_subnet" "service" {
  name                 = "service"
  resource_group_name  = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.4.0/24"]

  enforce_private_link_service_network_policies = true
}

resource "azurerm_subnet" "endpoint" {
  name                 = "endpoint"
  resource_group_name  = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.5.0/24"]

  enforce_private_link_endpoint_network_policies = true
}

resource "azurerm_public_ip" "example" {
  name                = "example-pip"
  sku                 = "Standard"
  location            = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.location
  resource_group_name = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
  allocation_method   = "Static"
}

resource "azurerm_lb" "example" {
  name                = "example-lb"
  sku                 = "Standard"
  location            = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.location
  resource_group_name = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name

  frontend_ip_configuration {
    name                 = azurerm_public_ip.example.name
    public_ip_address_id = azurerm_public_ip.example.id
  }
}

resource "azurerm_private_link_service" "example" {
  name                = "example-privatelink"
  location            = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.location
  resource_group_name = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name

  nat_ip_configuration {
    name      = azurerm_public_ip.example.name
    primary   = true
    subnet_id = azurerm_subnet.service.id
  }

  load_balancer_frontend_ip_configuration_ids = [
    azurerm_lb.example.frontend_ip_configuration[0].id,
  ]
}

resource "azurerm_private_endpoint" "example" {
  name                = "example-endpoint"
  location            = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.location
  resource_group_name = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
  subnet_id           = azurerm_subnet.endpoint.id

  private_service_connection {
    name                           = "example-privateserviceconnection"
    private_connection_resource_id = azurerm_private_link_service.example.id
    is_manual_connection           = false
  }
}
