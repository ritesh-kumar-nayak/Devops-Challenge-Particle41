resource "azurerm_kubernetes_cluster" "particle41-aks-cluster" {
  name                = var.cluster_name
  location            = azurerm_resource_group.particle41-rg.location
  resource_group_name = azurerm_resource_group.particle41-rg.name
  default_node_pool {
    name           = "defaultpool"
    node_count     = 2
    vm_size        = "Standard_DS2_v2"
    vnet_subnet_id = azurerm_subnet.private-snet[var.selected_subnet_key].id

  }
  identity {
    type = "SystemAssigned"
  }
  dns_prefix = "aks"
  network_profile {
    network_plugin = "azure"
    service_cidr   = "10.0.4.0/24"
    dns_service_ip = "10.0.4.10"

  }
}
