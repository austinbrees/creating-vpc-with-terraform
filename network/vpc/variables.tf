variable "project_id" {
  description = "The ID of the project where resources will be provisioned"
  type        = string
}

variable "regions" {
  description = "List of regions"
  default = [
    "us-central1",
    "europe-west1",
    "us-west1",
    "asia-east1",
    "us-east1",
    "asia-northeast1",
    "asia-southeast1",
    "us-east4",
    "australia-southeast1",
    "europe-west2",
    "europe-west3",
    "asia-south1",
    "europe-west4",
    "europe-north1",
    "us-west2",
    "us-west3",
    "us-west4",
    "europe-central2",
    "southamerica-west1",
    "us-east5",
    "us-south1",
    "me-west1",
    "europe-west12",
    "me-central1",
  ]
}

variable "cidrs" {
  description = "CIDR blocks for each region"
  default = {
    "us-central1" = "10.128.0.0/20",
    "europe-west1" = "10.132.0.0/20",
    "us-west1" = "10.138.0.0/20",
    "asia-east1" = "10.140.0.0/20",
    "us-east1" = "10.142.0.0/20",
    "asia-northeast1" = "10.146.0.0/20",
    "asia-southeast1" = "10.148.0.0/20",
    "us-east4" = "10.150.0.0/20",
    "australia-southeast1" = "10.152.0.0/20",
    "europe-west2" = "10.154.0.0/20",
    "europe-west3" = "10.156.0.0/20",
    "asia-south1" = "10.160.0.0/20",
    "europe-west4" = "10.164.0.0/20",
    "europe-north1" = "10.166.0.0/20",
    "us-west2" = "10.168.0.0/20",
    "us-west3" = "10.180.0.0/20",
    "us-west4" = "10.182.0.0/20",
    "europe-central2" = "10.186.0.0/20",
    "southamerica-west1" = "10.194.0.0/20",
    "us-east5" = "10.202.0.0/20",
    "us-south1" = "10.206.0.0/20",
    "me-west1" = "10.208.0.0/20",
    "europe-west12" = "10.210.0.0/20",
    "me-central1" = "10.212.0.0/20",
  }
}