output "instance_id" {
  description = "The ID of the instance"
  value       = google_compute_instance.instance.id
}

output "instance_self_link" {
  description = "The self link of the instance"
  value       = google_compute_instance.instance.self_link
}
