resource "google_container_cluster" "allowed" {
  pod_security_policy_config {
    enabled = true
  }
}
