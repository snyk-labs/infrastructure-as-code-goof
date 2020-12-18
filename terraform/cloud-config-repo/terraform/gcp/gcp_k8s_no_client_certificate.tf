resource "google_container_cluster" "allowed" {
  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

