resource "azurerm_sql_firewall_rule" "allowed" {
  name                = "test-rule"
  resource_group_name = "test-rg"
  server_name         = "test-server"
  start_ip_address    = "40.112.8.12"
  end_ip_address      = "40.112.8.12"
}