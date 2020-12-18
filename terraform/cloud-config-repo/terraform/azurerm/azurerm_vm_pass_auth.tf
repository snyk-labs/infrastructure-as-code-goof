resource "azurerm_linux_virtual_machine" "denied" {
  disable_password_authentication = false
}

resource "azurerm_virtual_machine" "denied" {
  os_profile_linux_config {
    disable_password_authentication = false
  }
}
