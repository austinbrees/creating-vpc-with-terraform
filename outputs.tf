output "instance_id" {
  description = "The ID of the created instance"
  value       = module.instances.id
}

output "network_id" {
  description = "The ID of the created network"
  value       = module.network.id
}