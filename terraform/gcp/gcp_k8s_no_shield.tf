resource "google_container_cluster" "denied" {}

resource "google_container_cluster" "denied_2" {
  enable_shielded_nodes = false
}
