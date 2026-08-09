resource "azurerm_virtual_network" "vnet-dev" {
  depends_on = [
    azurerm_resource_group.rg-dev
  ]
  for_each            = var.vnets
  name                = each.value.vnet_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  address_space       = each.value.address_space
}

resource "azurerm_subnet" "snet-dev" {
  depends_on = [
    azurerm_virtual_network.vnet-dev
  ]
  for_each             = var.snets
  name                 = each.value.snet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
  address_prefixes     = each.value.address_prefixes
}
