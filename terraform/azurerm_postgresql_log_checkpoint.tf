resource "azurerm_postgresql_configuration" "allowed" {
  name  = "log_checkpoints"
  value = "on"
}

resource "azurerm_postgresql_configuration" "allowed_2" {
  name  = "not_log_checkpoint"
  value = "on"
}

resource "azurerm_postgresql_configuration" "denied" {
  name  = "log_checkpoints"
  value = "off"
}
