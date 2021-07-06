resource "azurerm_kubernetes_cluster" "allowed" {
  addon_profile {
    oms_agent {
      enabled = true
    }
  }
}
