variable "vms" {}


resource "azurerm_network_interface" "nic-dev" {
  depends_on = [
    azurerm_subnet.snet-dev
  ]
  for_each            = var.vms
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  ip_configuration {
    name                          = each.value.nic_ip_name
    subnet_id                     = azurerm_subnet.snet-dev[each.value.subnet_key].id
    private_ip_address_allocation = each.value.pvt_ip_address_allocation
  }
}

resource "azurerm_linux_virtual_machine" "vm-dev" {
  depends_on = [
    azurerm_network_interface.nic-dev
  ]
  for_each                        = var.vms
  name                            = each.value.vm_name
  resource_group_name             = each.value.rg_name
  location                        = each.value.location
  size                            = each.value.vm_size
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  network_interface_ids           = [azurerm_network_interface.nic-dev[each.key].id]
  disable_password_authentication = false
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}





