resource "azurerm_mssql_server" "allowed" {
  extended_auditing_policy {
    retention_in_days = 90
  }
}

resource "azurerm_mssql_server" "allowed_2" {
  extended_auditing_policy {
    retention_in_days = 0
  }
}

resource "azurerm_mssql_server" "allowed_3" {
  extended_auditing_policy {
  }
}

resource "azurerm_mssql_server" "allowed_4" {
  extended_auditing_policy {
    retention_in_days = 91
  }
}

resource "azurerm_mssql_server" "allowed_5" {
}

resource "azurerm_sql_server" "allowed" {
}

resource "azurerm_mssql_server" "denied_2" {
  extended_auditing_policy {
    retention_in_days = 89
  }
}

resource "azurerm_mssql_server" "denied_3" {
  extended_auditing_policy {
    retention_in_days = 1
  }
}

resource "azurerm_sql_server" "allowed" {
  extended_auditing_policy {
    retention_in_days = 90
  }
}

resource "azurerm_sql_server" "denied" {
  extended_auditing_policy {
    retention_in_days = 89
  }
}
