resource "google_container_cluster" "denied" {
  enable_legacy_abac = true
}
