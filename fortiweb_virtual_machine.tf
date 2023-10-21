#resource "azurerm_public_ip" "fortiweb-public_ip" {
#  name                = "fortiweb_public_ip"
#  location            = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.location
#  resource_group_name = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
#  allocation_method   = "Dynamic"
#}
#resource "azurerm_network_interface_security_group_association" "fortiweb-association" {
#  network_interface_id      = azurerm_network_interface.fortiweb_dmz_network_interface.id
#  network_security_group_id = azurerm_network_security_group.nsg.id
#}
resource "azurerm_network_interface" "fortiweb_dmz_network_interface" {
  name                = "fortiweb_dmz_network_interface"
  location            = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.location
  resource_group_name = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
  ip_configuration {
    name                          = "fortiweb-dmz-ipconfig"
    private_ip_address_allocation = "Static"
    private_ip_address            = cidrhost(var.dmz-Prefix, 5)
    subnet_id                     = azurerm_subnet.dmz_subnet.id
    #    public_ip_address_id          = azurerm_public_ip.fortiweb-public_ip.id
  }
}

resource "azurerm_network_interface" "fortiweb_internal_network_interface" {
  name                = "fortiweb_internal_network_interface"
  location            = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.location
  resource_group_name = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
  ip_configuration {
    name                          = "fortiweb-internal-ipconfig"
    private_ip_address_allocation = "Static"
    private_ip_address            = cidrhost(var.internal-Prefix, 4)
    subnet_id                     = azurerm_subnet.internal_subnet.id
  }
}

resource "azurerm_linux_virtual_machine" "fortiweb_virtual_machine" {
  name                            = "fortiweb_virtual_machine"
  computer_name                   = "fortiweb"
  admin_username                  = random_pet.admin_username.id
  allow_extension_operations      = false
  availability_set_id             = azurerm_availability_set.fortinet_availability_set.id
  disable_password_authentication = true
  location                        = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.location
  resource_group_name             = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
  network_interface_ids           = [azurerm_network_interface.fortiweb_internal_network_interface.id, azurerm_network_interface.fortiweb_dmz_network_interface.id]
  #size                            = "Standard_F4s"
  size                       = "Standard_D4s_v3"
  encryption_at_host_enabled = true
  #  boot_diagnostics {
  #    storage_account_uri = azurerm_storage_account.storage-account.primary_blob_endpoint
  #  }
  admin_ssh_key {
    username   = random_pet.admin_username.id
    public_key = tls_private_key.ssh_key.public_key_openssh
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

resource "azurerm_virtual_machine_data_disk_attachment" "fortiweb_data_disk_attachment" {
  caching            = "None"
  lun                = 0
  managed_disk_id    = azurerm_managed_disk.fortiweb_log_disk.id
  virtual_machine_id = azurerm_linux_virtual_machine.fortiweb_virtual_machine.id
}

resource "azurerm_managed_disk" "fortiweb_log_disk" {
  create_option        = "Empty"
  location             = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.location
  resource_group_name  = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
  name                 = "fortiweb_log_disk"
  storage_account_type = "Premium_LRS"
  disk_size_gb         = "30"
  depends_on           = [azurerm_linux_virtual_machine.fortiweb_virtual_machine]
  #disk_encryption_key =
  #key_encryption_key =
  #encryption_settings {
  #  enabled = true
  #}
  #  encryption_settings {
  #  enabled = true
  #  disk_encryption_key {
  #    secret_url      = azurerm_key_vault_secret.secret.id
  #    source_vault_id = azurerm_key_vault.vault.id
  #  }
  #  key_encryption_key {
  #    key_url         = azurerm_key_vault_key.key.id
  #    source_vault_id = azurerm_key_vault.vault.id
  #  }
  #}
}
