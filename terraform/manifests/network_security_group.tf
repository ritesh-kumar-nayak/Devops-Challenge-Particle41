#Public NSG
resource "azurerm_network_security_group" "public-snet-nsg" {
  name                = var.public_snet_nsg
  location            = azurerm_resource_group.particle41-rg.location
  resource_group_name = azurerm_resource_group.particle41-rg.name
}

resource "azurerm_network_security_rule" "allow-http" {
  network_security_group_name = azurerm_network_security_group.public-snet-nsg.name
  resource_group_name         = azurerm_resource_group.particle41-rg.name
  name                        = var.allow_http_public_snet
  access                      = "Allow"
  direction                   = "Inbound"
  protocol                    = "Tcp"
  priority                    = 100
  source_port_range           = "*"
  destination_port_range      = "3000"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"

}

# Private NSG

resource "azurerm_network_security_group" "private-snet-nsg" {
  name                = var.private_snet_nsg
  location            = azurerm_resource_group.particle41-rg.location
  resource_group_name = azurerm_resource_group.particle41-rg.name

}

resource "azurerm_network_security_rule" "allow-internal" {
  name                        = var.allow_internal_private_snet
  resource_group_name         = azurerm_resource_group.particle41-rg.name
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "10.0.0.0/24" # Example internal range
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.private-snet-nsg.name

}