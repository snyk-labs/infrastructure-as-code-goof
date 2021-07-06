resource "google_container_cluster" "allowed" {}

resource "google_container_cluster" "allowed_2" {
  enable_legacy_abac = false
}
