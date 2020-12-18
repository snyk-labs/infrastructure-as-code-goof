resource "google_container_cluster" "denied" {
  metadata = {
  }
}

resource "google_container_cluster" "denied_2" {
  metadata = {
    disable-legacy-endpoints = "false"
  }
}
