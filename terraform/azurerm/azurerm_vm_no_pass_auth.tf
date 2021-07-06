resource "azurerm_linux_virtual_machine" "allowed" {}

resource "azurerm_linux_virtual_machine" "allowed_2" {
  disable_password_authentication = true
}

resource "azurerm_virtual_machine" "allowed" {}
