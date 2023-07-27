resource "azurerm_public_ip" "fortiweb-public_ip" {
  name                = "fortiweb_public_ip"
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name
  allocation_method   = "Dynamic"
}
resource "azurerm_network_interface_security_group_association" "fortiweb-association" {
  network_interface_id      = azurerm_network_interface.fortiweb-dmz-network-interface.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
resource "azurerm_network_interface" "fortiweb-dmz-network-interface" {
  name                = "fortiweb-dmz-network-interface"
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name
  ip_configuration {
    name                          = "fortiweb-dmz-ipconfig"
    private_ip_address_allocation = "Static"
    private_ip_address            = cidrhost(var.dmz-Prefix, 5)
    subnet_id                     = azurerm_subnet.dmz-subnet.id
    public_ip_address_id          = azurerm_public_ip.fortiweb-public_ip.id
  }
}
resource "azurerm_network_interface" "fortiweb-internal-network-interface" {
  name                = "fortiweb-internal-network-interface"
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name
  ip_configuration {
    name                          = "fortiweb-internal-ipconfig"
    private_ip_address_allocation = "Static"
    private_ip_address            = cidrhost(var.internal-Prefix, 4)
    subnet_id                     = azurerm_subnet.internal-subnet.id
  }
}
resource "azurerm_linux_virtual_machine" "fortiweb-virtual-machine" {
  name                            = "fortiweb-virtual-machine"
  computer_name                   = "fortiweb"
  admin_username                  = random_pet.admin_username.id
  admin_password                  = random_password.admin_password.result
  availability_set_id             = azurerm_availability_set.fortinet-availability-set.id
  disable_password_authentication = false
  location                        = azurerm_resource_group.resource-group.location
  resource_group_name             = azurerm_resource_group.resource-group.name
  network_interface_ids           = [azurerm_network_interface.fortiweb-internal-network-interface.id, azurerm_network_interface.fortiweb-dmz-network-interface.id]
  size                            = "Standard_F4s"
  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.storage-account.primary_blob_endpoint
  }
  admin_ssh_key {
    username   = random_pet.admin_username.id
    public_key = tls_private_key.ssh-key.public_key_openssh
    #public_key = file("~/.ssh/id_rsa.pub")
  }
  identity {
    type = "SystemAssigned"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }
  plan {
    name      = "fortinet_fw-vm_payg_v2"
    product   = "fortinet_fortiweb-vm_v5"
    publisher = "fortinet"
  }
  source_image_reference {
    offer     = "fortinet_fortiweb-vm_v5"
    publisher = "fortinet"
    sku       = "fortinet_fw-vm_payg_v2"
    version   = "latest"
  }
  custom_data = filebase64("cloud-init/fortiweb.conf")
}

resource "azurerm_virtual_machine_data_disk_attachment" "fortiweb-data-disk-attachment" {
  caching            = "None"
  lun                = 0
  managed_disk_id    = azurerm_managed_disk.fortiweb-log-disk.id
  virtual_machine_id = azurerm_linux_virtual_machine.fortiweb-virtual-machine.id
}
resource "azurerm_managed_disk" "fortiweb-log-disk" {
  create_option        = "Empty"
  location             = azurerm_resource_group.resource-group.location
  resource_group_name  = azurerm_resource_group.resource-group.name
  name                 = "fortiweb-log-disk"
  storage_account_type = "Premium_LRS"
  disk_size_gb         = "30"
}
data "azurerm_public_ip" "fortiweb-public_ip" {
  name                = azurerm_public_ip.fortiweb-public_ip.name
  resource_group_name = azurerm_resource_group.resource-group.name
  depends_on = [
    azurerm_linux_virtual_machine.fortiweb-virtual-machine,
  ]
}

output "fortiweb-public_ip_address" {
  value = data.azurerm_public_ip.fortiweb-public_ip.ip_address
}
