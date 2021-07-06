resource "google_app_engine_firewall_rule" "allowed" {
  project      = google_app_engine_application.app.project
  priority     = 1000
  action       = "DENY"
  source_range = "*"
}
