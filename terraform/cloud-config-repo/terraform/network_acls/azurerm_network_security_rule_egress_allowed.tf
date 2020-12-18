resource "azurerm_network_security_rule" "allowed" {
  direction = "Outbound"
  action  = "Deny"
  destination_address_prefix = "*"
}

resource "azurerm_network_security_rule" "allowed_2" {
  direction = "Outbound"
  action  = "Allow"
  destination_address_prefix = "10.0.0.0/0"
}

resource "azurerm_network_security_rule" "allowed_3" {
  direction = "Inbound"
  action  = "Allow"
  destination_address_prefix = "VPC"
}
