resource "google_service_account" "default" {
  account_id   = "enforcer-service-account"
  display_name = "Enforcer Service Account"
}

resource "google_compute_instance" "testvm" {
  name         = var.vmName
  machine_type = var.vmSize
  zone         = data.google_compute_zones.available.names[0]
  description  = "VM with Microsegmentation Enforcer installed"
  
  boot_disk {
    initialize_params {
      image = var.image_name
      size = 20
    }
  }

  network_interface {
    network    = "default"
    subnetwork = "default"

    access_config {}
  }

  service_account {
    email  = google_service_account.default.email
    scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/compute",
    ]
  }

  metadata = {
    startup-script = local.user_data
    ssh-keys       = "${var.adminUsername}:${file(var.ssh_public_key)}"
  }

  tags = ["microsegmentation-lab"]

  labels = {
    application = "microsegmentation-lab"
  }
}
