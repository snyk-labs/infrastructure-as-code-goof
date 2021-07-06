resource "google_container_cluster" "denied" {}

resource "google_container_cluster" "denied_2" {
  master_auth {
    client_certificate_config {
      issue_client_certificate = true
    }
  }
}

resource "google_container_cluster" "denied_3" {
  master_auth {}
}
