resource "azurerm_managed_disk" "allowed" {
  encryption_settings {
    enabled = true
  }
}

# azure encrypts all disks at rest by default with platform-managed keys
# https://docs.microsoft.com/en-us/azure/virtual-machines/disk-encryption
resource "azurerm_managed_disk" "allowed" {
}
