resource "azurerm_firewall_network_rule_collection" "denied" {
  name                = "testcollection"
  azure_firewall_name = azurerm_firewall.example.name
  resource_group_name = azurerm_resource_group.example.name
  priority            = 100
  action              = "Allow"
  rule {
    name = "denied"
    source_addresses = [
      "0.0.0.0/0",
    ]
    destination_ports = [
      "53",
    ]
    destination_addresses = [
      "8.8.8.8",
      "8.8.4.4",
    ]
    protocols = [
      "TCP",
      "UDP",
    ]
  }
  rule {
    name = "denied_2"
    source_addresses = [
      "1.0.0.0/0",
    ]
    destination_ports = [
      "53",
    ]
    destination_addresses = [
      "8.8.8.8",
      "8.8.4.4",
    ]
    protocols = [
      "TCP",
      "UDP",
    ]
  }

}
