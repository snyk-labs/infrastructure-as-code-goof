resource "azurerm_managed_disk" "denied" {
  encryption_settings {
    enabled = false
  }
}
