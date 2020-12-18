resource "azurerm_kubernetes_cluster" "allowed_2" {}

resource "azurerm_kubernetes_cluster" "allowed" {
  role_based_access_control {
    enabled = true
  }
}
