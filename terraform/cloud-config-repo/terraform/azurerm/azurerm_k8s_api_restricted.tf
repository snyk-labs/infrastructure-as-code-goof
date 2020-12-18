resource "azurerm_kubernetes_cluster" "allowed" {
  api_server_authorized_ip_ranges = ["10.0.0.0/24"]
}
