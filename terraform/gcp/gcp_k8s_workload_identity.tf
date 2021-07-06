resource "google_container_cluster" "allowed" {
  workload_metadata_config {
    node_metadata = "GKE_METADATA_SERVER"
  }
}

