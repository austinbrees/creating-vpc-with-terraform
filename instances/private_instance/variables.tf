variable "project_id" {
  description = "The ID of the project in which resources will be managed"
  type        = string
}

variable "name" {
  description = "The name of the instance"
  type        = string
  default     = "privatenet-us-vm"
}

variable "region" {
  description = "The region of the instance"
  type        = string
  default     = "us-east1"
}

variable "zone" {
  description = "The zone of the instance"
  type        = string
}

variable "machine_type" {
  description = "The machine type of the instance"
  type        = string
  default     = "e2-micro"
}

variable "network" {
  description = "The network of the instance"
  type        = string
  default     = "privatenet"
}

variable "subnetwork" {
  description = "The subnetwork of the instance"
  type        = string
  default     = "privatesubnet-us"
}
