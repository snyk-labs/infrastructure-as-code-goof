resource "azurerm_data_lake_store" "allowed" {}


resource "azurerm_data_lake_store" "allowed_2" {
  encryption_state = "Enabled"
}
