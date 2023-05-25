resource "google_compute_firewall" "managementnet_allow_icmp_ssh_rdp" {
  name    = "managementnet-allow-icmp-ssh-rdp"
  network = "managementnet"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "3389"]
  }

  source_ranges = ["0.0.0.0/0"]
  direction     = "INGRESS"
  priority      = 1000
  project       = var.project_id
}

resource "google_compute_firewall" "privatenet_allow_icmp_ssh_rdp" {
  name    = "privatenet-allow-icmp-ssh-rdp"
  network = "privatenet"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22", "3389"]
  }

  source_ranges = ["0.0.0.0/0"]
  direction     = "INGRESS"
  priority      = 1000
  project       = var.project_id
}

