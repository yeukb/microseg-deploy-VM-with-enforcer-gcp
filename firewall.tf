resource "google_compute_firewall" "inbound_rules" {
  project     = var.project
  name        = "microseg-firewall-inbound-rule"
  network     = "default"
  description = "Creates firewall rule targeting tagged instances"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol  = "tcp"
    ports     = ["22", "80", "443"]
  }

  source_ranges = var.allowed_src_ip_ranges
  target_tags   = ["microsegmentation-lab"]
}
