output "availability_set_name" {
  value = azurerm_availability_set.fortinet-availability-set.name
}

output "availability_set_fdc" {
  value = azurerm_availability_set.fortinet-availability-set.platform_fault_domain_count
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.ubuntu-virtual-machine.name
}
