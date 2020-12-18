resource "azurerm_data_lake_analytics_firewall_rule" "denied" {
  name                = "office-ip-range"
  account_name        = azurerm_data_lake_analytics.example.name
  resource_group_name = azurerm_resource_group.example.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "255.255.255.255"
}
