resource "azurerm_synapse_firewall_rule" "allowed" {
  name                 = "AllowAll"
  synapse_workspace_id = azurerm_synapse_workspace.test.id
  start_ip_address     = "1.1.1.1"
  end_ip_address       = "255.255.255.255"
}
