resource "random_pet" "fortigate-admin_username" {
  keepers = {
    resource_group_name = azurerm_resource_group.resource-group.name
  }
}
resource "azurerm_public_ip" "fortigate-public_ip" {
  name                = "fortigate-public_ip"
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name
  allocation_method   = "Dynamic"
}
resource "azurerm_public_ip" "VIP-public_ip" {
  name                = "VIP-public_ip"
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name
  allocation_method   = "Dynamic"
}
resource "azurerm_network_interface_security_group_association" "fortigate-association" {
  network_interface_id      = azurerm_network_interface.fortigate-external-network-interface.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
resource "azurerm_network_interface" "fortigate-external-network-interface" {
  name                = "fortigate-external-network-interface"
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name
  ip_configuration {
    name                          = "fortigate-external-ipconfig"
    primary                       = true
    private_ip_address_allocation = "Static"
    private_ip_address            = cidrhost(var.external-Prefix, 4)
    subnet_id                     = azurerm_subnet.external-subnet.id
    public_ip_address_id          = azurerm_public_ip.fortigate-public_ip.id
  }
  ip_configuration {
    name                          = "VIP-external-ipconfig"
    private_ip_address_allocation = "Static"
    private_ip_address            = cidrhost(var.external-Prefix, 100)
    subnet_id                     = azurerm_subnet.external-subnet.id
    public_ip_address_id          = azurerm_public_ip.VIP-public_ip.id
  }
}
resource "azurerm_network_interface" "fortigate-dmz-network-interface" {
  name                = "fortigate-dmz-network-interface"
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name
  ip_configuration {
    name                          = "fortigate-dmz-ipconfig"
    private_ip_address_allocation = "Static"
    private_ip_address            = cidrhost(var.dmz-Prefix, 4)
    subnet_id                     = azurerm_subnet.dmz-subnet.id
  }
}
resource "azurerm_linux_virtual_machine" "fortigate-virtual-machine" {
  name                            = "fortigate"
  computer_name                   = "fortigate"
  admin_password                  = random_pet.fortigate-admin_password
  admin_username                  = var.admin_username
  availability_set_id             = azurerm_availability_set.fortinet-availability-set.id
  disable_password_authentication = false
  location                        = azurerm_resource_group.resource-group.location
  resource_group_name             = azurerm_resource_group.resource-group.name
  network_interface_ids           = [azurerm_network_interface.fortigate-external-network-interface.id, azurerm_network_interface.fortigate-dmz-network-interface.id]
  size                            = "Standard_F4s"
  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.storage-account.primary_blob_endpoint
  }
  identity {
    type = "SystemAssigned"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }
  plan {
    name      = "fortinet_fg-vm_payg_2022"
    product   = "fortinet_fortigate-vm_v5"
    publisher = "fortinet"
  }
  source_image_reference {
    offer     = "fortinet_fortigate-vm_v5"
    publisher = "fortinet"
    sku       = "fortinet_fg-vm_payg_2022"
    version   = "latest"
  }
  custom_data = filebase64("cloud-init/fortigate.conf")
}

data "azurerm_public_ip" "VIP-public_ip" {
  name                = azurerm_public_ip.VIP-public_ip.name
  resource_group_name = azurerm_resource_group.resource-group.name
  depends_on = [
    azurerm_linux_virtual_machine.fortigate-virtual-machine,
  ]
}
data "azurerm_public_ip" "fortigate-public_ip" {
  name                = azurerm_public_ip.fortigate-public_ip.name
  resource_group_name = azurerm_resource_group.resource-group.name
  depends_on = [
    azurerm_linux_virtual_machine.fortigate-virtual-machine,
  ]
}

output "VIP-public_ip_address" {
  value = data.azurerm_public_ip.VIP-public_ip.ip_address
}
output "fortigate-public_ip_address" {
  value = data.azurerm_public_ip.fortigate-public_ip.ip_address
}
