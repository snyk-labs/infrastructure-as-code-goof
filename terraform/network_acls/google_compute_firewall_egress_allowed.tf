resource "google_compute_firewall" "allowed" {
  destination_ranges = [
    "192.168.0.0/16"
  ]
}

resource "google_compute_firewall" "allowed" {
  direction = "EGRESS"
  destination_ranges = [
    "192.168.0.0/16"
  ]
}
