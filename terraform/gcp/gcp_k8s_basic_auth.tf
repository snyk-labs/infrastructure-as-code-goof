resource "google_container_cluster" "denied" {}

resource "google_container_cluster" "denied_2" {
  master_auth {
    issue_client_certificate = true
  }
}

resource "google_container_cluster" "denied_3" {
  master_auth {}
}

resource "google_container_cluster" "denied_4" {
  master_auth {
    username = "test"
  }
}

resource "google_container_cluster" "denied_5" {
  master_auth {
    username = "test"
    password = "why"
  }
}
