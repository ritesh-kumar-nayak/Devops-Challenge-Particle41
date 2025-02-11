resource "azurerm_public_ip" "particle41-public-ip" {
  name                = var.lb_public_ip
  location            = azurerm_resource_group.particle41-rg.location
  resource_group_name = azurerm_resource_group.particle41-rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}


resource "azurerm_lb" "particle41-lb" {
  name                = var.azure_lb
  location            = azurerm_resource_group.particle41-rg.location
  resource_group_name = azurerm_resource_group.particle41-rg.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "PublicFrontend"
    public_ip_address_id = azurerm_public_ip.particle41-public-ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "lb-backend-pool" {
  loadbalancer_id = azurerm_lb.particle41-lb.id
  name            = var.backend_pool

}

resource "azurerm_lb_rule" "lb-rule" {
  name                           = "HTTP"
  protocol                       = "Tcp"
  loadbalancer_id                = azurerm_lb.particle41-lb.id
  backend_port                   = 3000 # Port on the AKS nodes
  frontend_port                  = 3000 # Port exposed to the internet
  frontend_ip_configuration_name = azurerm_lb.particle41-lb.frontend_ip_configuration[0].name
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.lb-backend-pool.id]

}