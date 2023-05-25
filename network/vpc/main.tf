resource "google_compute_network" "managementnet" {
  name                    = "managementnet"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
  mtu                     = 1460
  project                 = var.project_id
}

resource "google_compute_subnetwork" "managementsubnet_us" {
  name          = "managementsubnet-us"
  ip_cidr_range = "10.130.0.0/20"
  network       = google_compute_network.managementnet.self_link
  region        = "us-east1"
  project       = var.project_id
}
resource "google_compute_network" "privatenet" {
  name                    = "privatenet"
  auto_create_subnetworks = false
  project                 = var.project_id
}

resource "google_compute_subnetwork" "privatesubnet_us" {
  name          = "privatesubnet-us"
  ip_cidr_range = "172.16.0.0/24"
  network       = google_compute_network.privatenet.self_link
  region        = "us-east1"
  project       = var.project_id
}

resource "google_compute_subnetwork" "privatesubnet_eu" {
  name          = "privatesubnet-eu"
  ip_cidr_range = "172.20.0.0/20"
  network       = google_compute_network.privatenet.self_link
  region        = "europe-west1"
  project       = var.project_id
}

