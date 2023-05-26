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
resource "google_compute_firewall" "allow_icmp" {
  name    = "mynetwork-allow-icmp-1"
  network = google_compute_network.mynetwork.self_link

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
  log_config {
    metadata = "none"
  }
  description = "Allow ICMP from anywhere"
  priority    = 1000
}

resource "google_compute_firewall" "allow_ssh" {
  name    = "mynetwork-allow-ssh-1"
  network = google_compute_network.mynetwork.self_link

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  log_config {
    metadata = "none"
  }
  description = "Allow SSH from anywhere"
  priority    = 1000
}

