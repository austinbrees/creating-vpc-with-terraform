variable "project_id" {
  description = "The ID of the project in which resources will be provisioned"
  type        = string
}

variable "region" {
  description = "The region where resources will be provisioned"
  type        = string
  default     = "us-east1"
}
