resource "azurerm_network_watcher_flow_log" "allowed" {
  retention_policy {
    enabled = true
    days    = 90
  }
}

resource "azurerm_network_watcher_flow_log" "allowed_2" {
  retention_policy {
    enabled = true
    days    = 91
  }
}

resource "azurerm_network_watcher_flow_log" "denied" {
  retention_policy {
    enabled = false
    days    = 90
  }
}

resource "azurerm_network_watcher_flow_log" "denied_2" {
  retention_policy {
    enabled = true
    days    = 0
  }
}

resource "azurerm_network_watcher_flow_log" "denied_3" {
  retention_policy {
    enabled = true
    days    = 89
  }
}
