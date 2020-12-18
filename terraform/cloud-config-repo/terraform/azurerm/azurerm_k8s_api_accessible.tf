resource "azurerm_kubernetes_cluster" "denied" {}

resource "azurerm_kubernetes_cluster" "denied_2" {
  api_server_authorized_ip_ranges = ["0.0.0.0/0"]
}
