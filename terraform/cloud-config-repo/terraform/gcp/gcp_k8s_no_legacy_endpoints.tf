resource "google_container_cluster" "allowed" {
}

resource "google_container_cluster" "allowed_2" {
  metadata = {
    disable-legacy-endpoints = "true"
  }
}
