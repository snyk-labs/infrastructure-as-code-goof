resource "azurerm_storage_account" "allowed" {
  account_kind = "BlobStorage"
}

resource "azurerm_storage_account" "allowed_2" {
  account_kind = "BlockBlobStorage"
}

resource "azurerm_storage_account" "allowed_3" {
  account_kind = "FileStorage"
}

resource "azurerm_storage_account" "allowed_4" {
  queue_properties {
    logging {
      read = true
    }
  }
}

resource "azurerm_storage_account" "denied" {
  queue_properties {
  }
}

resource "azurerm_storage_account" "denied_2" {
  queue_properties {
    logging {
      read = false
    }
  }
}
