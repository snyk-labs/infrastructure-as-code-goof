resource "azurerm_mssql_server" "allowed" {
  extended_auditing_policy {
  }
}

resource "azurerm_mssql_server" "denied" {
}

resource "azurerm_sql_server" "allowed" {
  extended_auditing_policy {
    retention_in_days = 89
  }
}

resource "azurerm_sql_server" "denied" {
}

