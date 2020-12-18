resource "google_container_cluster" "allowed" {
  enable_shielded_nodes = true
}
