resource "google_container_cluster" "allowed" {
  master_auth {
    username = ""
    password = ""
  }
}
