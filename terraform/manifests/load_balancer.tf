resource "azurerm_public_ip" "publci-ip-az-lb" {
  name                = var.lb_public_ip
  location            = azurerm_resource_group.particle41-rg.location
  resource_group_name = azurerm_resource_group.particle41-rg.name
  allocation_method   = "Static"

}

resource "azurerm_lb" "particle41-azure-lb" {
  name                = var.azure_lb
  resource_group_name = azurerm_resource_group.particle41-rg.name
  location            = azurerm_resource_group.particle41-rg.location
  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = azurerm_public_ip.publci_ip_az_lb.id
  }

}

resource "azurerm_lb_backend_address_pool" "lb-backend-pool" {
  loadbalancer_id = azurerm_lb.particle41-azure-lb.id
  name            = var.backend_pool

}

resource "azurerm_lb_rule" "lb-rule" {
  name                           = "HTTP"
  protocol                       = "tcp"
  loadbalancer_id                = azurerm_lb.particle41-azure-lb.id
  backend_port                   = 3000 # Port on the AKS nodes
  frontend_port                  = 3000 # Port exposed to the internet
  frontend_ip_configuration_name = azurerm_lb.particle41-azure-lb.frontend_ip_configuration[0].name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.lb-backend-pool.id]

}