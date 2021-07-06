resource "azurerm_firewall_application_rule_collection" "denied" {
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
    target_fqdns = [
      "*.google.com",
    ]
    protocol {
      port = "443"
      type = "Https"
    }
  }
  rule {
    name = "allowed"
    source_addresses = [
      "1.0.0.0/0",
    ]
    target_fqdns = [
      "*.google.com",
    ]
    protocol {
      port = "443"
      type = "Https"
    }
  }

}
