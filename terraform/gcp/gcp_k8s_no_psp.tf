resource "google_container_cluster" "denied" {}

resource "google_container_cluster" "denied_2" {
  pod_security_policy_config {
    enabled = false
  }
}
