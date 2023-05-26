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
resource "google_compute_network" "mynetwork" {
  name                    = "mynetwork"
  auto_create_subnetworks = false  # Set to false to manage subnets manually
  project                 = "group-work-387811"
}

resource "google_compute_subnetwork" "mynetwork" {
  for_each       = { for k, v in var.cidrs : k => v if contains(var.regions, k) }
  
  name          = "mynetwork-${each.key}"  # A unique name for each subnetwork
  network       = google_compute_network.mynetwork.self_link
  region        = each.key
  ip_cidr_range = each.value
  project       = "group-work-387811"
}
