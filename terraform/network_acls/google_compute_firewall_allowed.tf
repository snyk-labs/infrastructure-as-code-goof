resource "google_compute_firewall" "allowed" {
  name    = "test-firewall"
  network = google_compute_network.default.name
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }
  source_tags = ["web"]
}

resource "google_compute_firewall" "allowed_2" {
  name    = "test-firewall"
  network = google_compute_network.default.name
  direction = "EGRESS"
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000"]
  }
  source_ranges = ["0.0.0.0/0"]
}