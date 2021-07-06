resource "google_container_cluster" "denied" {
  workload_metadata_config {
    node_metadata = "EXPOSE"
  }
}

resource "google_container_cluster" "denied_2" {
  workload_metadata_config {
    node_metadata = "SECURE"
  }
}


resource "google_container_cluster" "denied_3" {}
