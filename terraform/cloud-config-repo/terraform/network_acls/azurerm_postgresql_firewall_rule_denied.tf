resource "azurerm_postgresql_firewall_rule" "denied" {
  name                = "test-rule"
  resource_group_name = "test-rg"
  server_name         = "test-server"
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "255.255.255.255"
}
