# Step 1 - Create a VPC network

## Management Network 


1. gcloud compute networks create managementnet --project=qwiklabs-gcp-02-9ad387cb4729 --subnet-mode=custom --mtu=1460 --bgp-routing-mode=regional

2. gcloud compute networks subnets create managementsubnet-us --project=qwiklabs-gcp-02-9ad387cb4729 --range=10.130.0.0/20 --stack-type=IPV4_ONLY --network=managementnet --region=us-east1

## Private Network 

1. gcloud compute networks create privatenet --subnet-mode=custom
2. gcloud compute networks subnets create privatesubnet-us --network=privatenet --region=us-east1 --range=172.16.0.0/24
3. gcloud compute networks subnets create privatesubnet-eu --network=privatenet --region=europe-west1 --range=172.20.0.0/20

## Firewall Rules

### firewall rules for management network

1. gcloud compute --project=qwiklabs-gcp-02-9ad387cb4729 firewall-rules create managementnet-allow-icmp-ssh-rdp --direction=INGRESS --priority=1000 --network=managementnet --action=ALLOW --rules=tcp:22,tcp:3389,other:icmp --source-ranges=0.0.0.0/0

### firewall rules for private network

1. gcloud compute firewall-rules create privatenet-allow-icmp-ssh-rdp --direction=INGRESS --priority=1000 --network=privatenet --action=ALLOW --rules=icmp,tcp:22,tcp:3389 --source-ranges=0.0.0.0/0


## Create VMs

### Management VM

# This code is compatible with Terraform 4.25.0 and versions that are backwards compatible to 4.25.0.
# For information about validating this Terraform code, see https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/google-cloud-platform-build#format-and-validate-the-configuration

resource "google_compute_instance" "managementnet-us-vm" {
  boot_disk {
    auto_delete = true
    device_name = "managementnet-us-vm"

    initialize_params {
      image = "projects/debian-cloud/global/images/debian-11-bullseye-v20230509"
      size  = 10
      type  = "pd-balanced"
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false

  labels = {
    goog-ec-src = "vm_add-tf"
  }

  machine_type = "e2-micro"

  metadata = {
    enable-oslogin = "true"
  }

  name = "managementnet-us-vm"

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    subnetwork = "projects/qwiklabs-gcp-02-9ad387cb4729/regions/us-east1/subnetworks/managementsubnet-us"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
  }

  service_account {
    email  = "397510074966-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  zone = "us-east1-b"
}

### Private VM

1. gcloud compute instances create privatenet-us-vm --zone="us-east1-b" --machine-type=e2-micro --subnet=privatesubnet-us

### Appliance VM 

# This code is compatible with Terraform 4.25.0 and versions that are backwards compatible to 4.25.0.
# For information about validating this Terraform code, see https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/google-cloud-platform-build#format-and-validate-the-configuration

# This code is compatible with Terraform 4.25.0 and versions that are backwards compatible to 4.25.0.
# For information about validating this Terraform code, see https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/google-cloud-platform-build#format-and-validate-the-configuration

resource "google_compute_instance" "vm-appliance" {
  boot_disk {
    auto_delete = true
    device_name = "vm-appliance"

    initialize_params {
      image = "projects/debian-cloud/global/images/debian-11-bullseye-v20230509"
      size  = 10
      type  = "pd-balanced"
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false

  labels = {
    goog-ec-src = "vm_add-tf"
  }

  machine_type = "e2-standard-4"

  metadata = {
    enable-oslogin = "true"
  }

  name = "vm-appliance"

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    subnetwork = "projects/qwiklabs-gcp-02-9ad387cb4729/regions/us-east1/subnetworks/privatesubnet-us"
  }

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    subnetwork = "projects/qwiklabs-gcp-02-9ad387cb4729/regions/us-east1/subnetworks/managementsubnet-us"
  }

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    subnetwork = "projects/qwiklabs-gcp-02-9ad387cb4729/regions/us-east1/subnetworks/mynetwork"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
  }

  service_account {
    email  = "397510074966-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  zone = "us-east1-b"
}

