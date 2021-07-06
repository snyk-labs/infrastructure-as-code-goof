resource "azurerm_data_lake_store_firewall_rule" "allowed" {
  name                = "office-ip-range"
  account_name        = azurerm_data_lake_store.example.name
  resource_group_name = azurerm_resource_group.example.name
  start_ip_address    = "1.2.3.4"
  end_ip_address      = "2.3.4.5"
}