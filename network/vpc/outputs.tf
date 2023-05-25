output "privatenet" {
  description = "The self link of the created privatenet"
  value       = google_compute_network.privatenet.self_link
}

output "privatesubnet_us" {
  description = "The self link of the created privatesubnet-us"
  value       = google_compute_subnetwork.privatesubnet_us.self_link
}

output "privatesubnet_eu" {
  description = "The self link of the created privatesubnet-eu"
  value       = google_compute_subnetwork.privatesubnet_eu.self_link
}
