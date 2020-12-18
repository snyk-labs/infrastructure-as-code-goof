resource "azurerm_monitor_log_profile" "allowed" {
  retention_policy {
    enabled = true
    days    = 365
  }
}

resource "azurerm_monitor_log_profile" "allowed_2" {
  retention_policy {
    enabled = true
    days    = 366
  }
}

resource "azurerm_monitor_log_profile" "denied" {
  retention_policy {
    enabled = false
    days    = 366
  }
}

resource "azurerm_monitor_log_profile" "denied_2" {
  retention_policy {
    enabled = true
    days    = 354
  }
}

resource "azurerm_monitor_log_profile" "denied_3" {
  retention_policy {
    enabled = true
    days    = 0
  }
}
