resource "google_compute_firewall" "denied" {
  direction = "EGRESS"
  destination_ranges = [
    "0.0.0.0/0"
  ]
  allow {
    protocol = "ICMP"
  }
}
