resource "azurerm_virtual_network" "particle41-vnet" {

  name                = var.vnet_name
  address_space       = var.vnet_address_space
  resource_group_name = azurerm_resource_group.particle41-rg.name
  location            = azurerm_resource_group.particle41-rg.location

}

resource "azurerm_subnet" "private-snet" {
  for_each             = var.private_subnets
  name                 = each.key
  virtual_network_name = azurerm_virtual_network.particle41-vnet.name
  address_prefixes     = [each.value]
  resource_group_name  = azurerm_resource_group.particle41-rg.name

}

resource "azurerm_subnet" "public-subnet" {
  for_each             = var.public_subnets
  name                 = each.key
  virtual_network_name = azurerm_virtual_network.particle41-vnet.name
  address_prefixes     = [each.value]
  resource_group_name  = azurerm_resource_group.particle41-rg.name

}
