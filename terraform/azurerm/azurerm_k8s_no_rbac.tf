resource "azurerm_kubernetes_cluster" "denied" {
  role_based_access_control {
    enabled = false
  }
}
