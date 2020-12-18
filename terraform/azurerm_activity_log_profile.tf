resource "azurerm_monitor_log_profile" "allowed" {
  categories = [
    "Action",
    "Delete",
    "Write"
  ]
}

resource "azurerm_monitor_log_profile" "denied" {
  categories = [
    "Action",
  ]
}

resource "azurerm_monitor_log_profile" "denied_2" {
  categories = [
    "Action",
    "Delete",
  ]
}

resource "azurerm_monitor_log_profile" "denied_3" {
  categories = [
    "Write",
  ]
}

resource "azurerm_monitor_log_profile" "denied_4" {
  categories = [
  ]
}
