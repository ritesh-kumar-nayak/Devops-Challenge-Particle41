resource "azurerm_kubernetes_cluster" "particle41-aks-cluster" {
  name                = var.cluster_name
  location            = azurerm_resource_group.particle41-rg.location
  resource_group_name = azurerm_resource_group.particle41-rg.name
  default_node_pool {
    name           = "default-pool"
    node_count     = 2
    vm_size        = "Standard_DS2_v2"
    vnet_subnet_id = azurerm_subnet.private-snet[private_snet_1].id
  }
  identity {
    type = "SystemAssigned"
  }
  dns_prefix = "aks"
}

