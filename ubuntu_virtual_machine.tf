#resource "azurerm_public_ip" "ubuntu-public_ip" {
#  name                = "ubuntu_public_ip"
#  location            = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.location
#  resource_group_name = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
#  allocation_method   = "Dynamic"
#}
#resource "azurerm_network_interface_security_group_association" "ubuntu-association" {
#  network_interface_id      = azurerm_network_interface.ubuntu-internal-network-interface.id
#  network_security_group_id = azurerm_network_security_group.nsg.id
#}
resource "azurerm_network_interface" "ubuntu-internal-network-interface" {
  name                = "ubuntu-internal-network-interface"
  location            = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.location
  resource_group_name = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
  ip_configuration {
    name = "ubuntu-internal-ipconfig"
    #private_ip_address_allocation = "Dynamic"
    private_ip_address_allocation = "Static"
    private_ip_address            = cidrhost(var.internal-Prefix, 5)
    subnet_id                     = azurerm_subnet.internal-subnet.id
    #public_ip_address_id          = azurerm_public_ip.ubuntu-public_ip.id
  }
}
resource "azurerm_network_interface" "ubuntu-dmz-network-interface" {
  name                = "ubuntu-dmz-network-interface"
  location            = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.location
  resource_group_name = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
  ip_configuration {
    name                          = "ubuntu-dmz-ipconfig"
    private_ip_address_allocation = "Static"
    private_ip_address            = cidrhost(var.dmz-Prefix, 6)
    subnet_id                     = azurerm_subnet.dmz-subnet.id
  }
}
resource "azurerm_linux_virtual_machine" "ubuntu-virtual-machine" {
  name                            = "ubuntu-virtual-machine"
  computer_name                   = "ubuntu"
  admin_username                  = random_pet.admin_username.id
  disable_password_authentication = true
  allow_extension_operations      = false
  availability_set_id             = azurerm_availability_set.fortinet-availability-set.id
  location                        = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.location
  resource_group_name             = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
  network_interface_ids           = [azurerm_network_interface.ubuntu-internal-network-interface.id, azurerm_network_interface.ubuntu-dmz-network-interface.id]
  size                            = "Standard_F2s_v2"
  admin_ssh_key {
    username   = random_pet.admin_username.id
    public_key = tls_private_key.ssh-key.public_key_openssh
    #public_key = file("~/.ssh/id_rsa.pub")
  }
  #  boot_diagnostics {
  #    storage_account_uri = azurerm_storage_account.storage-account.primary_blob_endpoint
  #  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}

#data "azurerm_public_ip" "ubuntu-public_ip" {
#  name                = azurerm_public_ip.ubuntu-public_ip.name
#  resource_group_name = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
#  depends_on = [
#    azurerm_linux_virtual_machine.ubuntu-virtual-machine,
#  ]
#}

#output "ubuntu-public_ip_address" {
#  value = data.azurerm_public_ip.ubuntu-public_ip.ip_address
#}
