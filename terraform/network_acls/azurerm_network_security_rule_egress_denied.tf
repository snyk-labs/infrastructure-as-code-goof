resource "azurerm_network_security_rule" "denied" {
  direction = "Outbound"
  action  = "Allow"
  destination_address_prefix = "*"
}

resource "azurerm_network_security_rule" "denied_2" {
  direction = "Outbound"
  action  = "Allow"
  destination_address_prefix = "0.0.0.0/0"
}

resource "azurerm_network_security_rule" "denied_3" {
  direction = "Outbound"
  action  = "Allow"
  destination_address_prefix = "Internet"
}
