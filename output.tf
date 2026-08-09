output "resource_group" {
  value = azurerm_resource_group.rg-dev
}

output "virtual_network_name" {
  value = azurerm_virtual_network.vnet-dev
}

output "subnet_ids" {
  value = {
    for k, v in azurerm_subnet.snet-dev :
    k => v.id
  }
}

output "vm_ids" {
  value = {
    for k, v in azurerm_linux_virtual_machine.vm-dev :
    k => v.id
  }
}

output "vm_private_ips" {
  value = {
    for k, v in azurerm_network_interface.nic-dev :
    k => v.private_ip_address
  }
}

output "bastion_public_ip" {
  value = {
    for k, v in azurerm_public_ip.pip-dev :
    k => v.ip_address
  }
}

output "bastion_id" {
  value = {
    for k, v in azurerm_bastion_host.bastion-dev :
    k => v.id
  }
}