resource "azurerm_bastion_host" "bastion-dev" {
  depends_on = [
    azurerm_subnet.snet-dev,
    azurerm_public_ip.pip-dev
  ]
  for_each            = var.bastions
  name                = each.value.bastion_name
  resource_group_name = each.value.rg_name
  location            = each.value.location

  ip_configuration {
    name                 = each.value.ip_config_name
    subnet_id            = azurerm_subnet.snet-dev[each.value.subnet_key].id
    public_ip_address_id = azurerm_public_ip.pip-dev[each.key].id
  }
}

resource "azurerm_public_ip" "pip-dev" {
  depends_on = [
    azurerm_resource_group.rg-dev
  ]
  for_each            = var.bastions
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
}


variable "bastions" {

}

# data "azurerm_subnet" "bastion_subnet" {
#     for_each = var.bastions
#   name = each.value.bastion_subnet
#  resource_group_name = each.value.rg_name
#   virtual_network_name = each.value.vnet_name
# }