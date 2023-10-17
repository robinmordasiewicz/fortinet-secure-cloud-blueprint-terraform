#resource "azurerm_public_ip" "fortigate-public_ip" {
#  name                = "fortigate-public_ip"
#  location            = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.location
#  resource_group_name = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
#  allocation_method   = "Dynamic"
#}
resource "azurerm_network_security_group" "vip_allow_https_tcp_nsg" { #tfsec:ignore:azure-network-no-public-ingress
  name                = "vip_allow_https_tcp_nsg"
  location            = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.location
  resource_group_name = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name

  security_rule {
    name                       = "VIP-allow_https_tcp"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["443"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
resource "azurerm_public_ip" "vip_public_ip" {
  name                = "vip_public_ip"
  location            = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.location
  resource_group_name = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
  allocation_method   = "Dynamic"
}
resource "azurerm_network_interface_security_group_association" "fortigate_association" {
  network_interface_id      = azurerm_network_interface.fortigate_external_network_interface.id
  network_security_group_id = azurerm_network_security_group.vip_allow_https_tcp_nsg.id
}
resource "azurerm_network_interface" "fortigate_external_network_interface" {
  #checkov:skip=CKV_AZURE_119:Fortigate gets a public IP
  name                = "fortigate_external_network_interface"
  location            = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.location
  resource_group_name = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
  ip_configuration {
    name                          = "fortigate-external-ipconfig"
    primary                       = true
    private_ip_address_allocation = "Static"
    private_ip_address            = cidrhost(var.external-Prefix, 4)
    subnet_id                     = azurerm_subnet.external_subnet.id
  }
  ip_configuration {
    name                          = "VIP-external-ipconfig"
    private_ip_address_allocation = "Static"
    private_ip_address            = cidrhost(var.external-Prefix, 100)
    subnet_id                     = azurerm_subnet.external_subnet.id
    public_ip_address_id          = azurerm_public_ip.vip_public_ip.id
  }
}
resource "azurerm_network_interface" "fortigate_dmz_network_interface" {
  name                = "fortigate_dmz_network_interface"
  location            = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.location
  resource_group_name = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
  ip_configuration {
    name                          = "fortigate-dmz-ipconfig"
    private_ip_address_allocation = "Static"
    private_ip_address            = cidrhost(var.dmz-Prefix, 4)
    subnet_id                     = azurerm_subnet.dmz_subnet.id
  }
}
resource "azurerm_linux_virtual_machine" "fortigate_virtual_machine" {
  name                            = "fortigate_virtual_machine"
  computer_name                   = "fortigate"
  admin_username                  = random_pet.admin_username.id
  availability_set_id             = azurerm_availability_set.fortinet_availability_set.id
  allow_extension_operations      = false
  disable_password_authentication = true
  location                        = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.location
  resource_group_name             = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
  network_interface_ids           = [azurerm_network_interface.fortigate_external_network_interface.id, azurerm_network_interface.fortigate_dmz_network_interface.id]
  size                            = "Standard_F4s"
  admin_ssh_key {
    username   = random_pet.admin_username.id
    public_key = tls_private_key.ssh_key.public_key_openssh
    #public_key = file("~/.ssh/id_rsa.pub")
  }
  #  boot_diagnostics {
  #    storage_account_uri = azurerm_storage_account.storage-account.primary_blob_endpoint
  #  }
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

data "azurerm_public_ip" "vip_public_ip" {
  name                = azurerm_public_ip.vip_public_ip.name
  resource_group_name = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
  depends_on = [
    azurerm_linux_virtual_machine.fortigate_virtual_machine,
  ]
}
#data "azurerm_public_ip" "fortigate-public_ip" {
#  name                = azurerm_public_ip.fortigate-public_ip.name
#  resource_group_name = data.azurerm_resource_group.AZURE_RESOURCE_GROUP.name
#  depends_on = [
#    azurerm_linux_virtual_machine.fortigate_virtual_machine,
#  ]
#}

output "vip_public_ip_address" {
  value       = data.azurerm_public_ip.vip_public_ip.ip_address
  description = "Public IP address"
}

#output "fortigate-public_ip_address" {
#  value = data.azurerm_public_ip.fortigate-public_ip.ip_address
#}
