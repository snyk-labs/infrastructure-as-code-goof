resource "azurerm_kubernetes_cluster" "denied" {}

resource "azurerm_kubernetes_cluster" "denied_2" {
  addon_profile {
    oms_agent {
      enabled = false
    }
  }
}
