# This code is compatible with Terraform 4.25.0 and versions that are backward compatible to 4.25.0.
# For information about validating this Terraform code, see https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/google-cloud-platform-build#format-and-validate-the-configuration

resource "google_compute_instance" "mynet-us" {
  boot_disk {
    auto_delete = true
    device_name = "mynet-us-vm"

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
    ssh-keys = "frbarca:ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBFZZJ+9QizM9mBXWU98vEq3oCodF+aULsv+z/8O93RNrMousvKZplefRnmpfHMm72QNgr7bEvH3gDqIB089Sgwo= google-ssh {\"userName\":\"frbarca@student.ie.edu\",\"expireOn\":\"2023-05-25T13:59:26+0000\"}\nfrbarca:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAGizQ3XkBBElvU/fSCg7IQ8hOnVqlWOmrwv4Zvt5JoIFhjR7C18s3tDZNcBL17vNQzwqzAFXEHzC4hGVuF0bcF6pBXS/1LLW9R+p0AtdvrkSfRzl25AVRI18v3tkIOFixrZ2lIqRmFwGrFg17rvcK4O4tVRkyRbDkTqNrpsUB2Yo0pG3J8env3pzb2OkLMPEYHpDguwkvVsdkvft4oRIfHTFiQo1B51l7Y4A+7FzSKgCOPr8jHoPbQSoxSC53auoPfFxZJMCD44MybiMH8zv+0/kLjv6dc2whQlmO89W3hHsCDV8JIsE54yw3G6TI7MCG0j/w/oM9nLvMMsqrPcKy0U= google-ssh {\"userName\":\"frbarca@student.ie.edu\",\"expireOn\":\"2023-05-25T13:59:42+0000\"}"
  }

  name = "mynet-us-vm-1"

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    subnetwork = "projects/group-work-387811/regions/us-east1/subnetworks/mynetwork-us-east1"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
  }

  service_account {
    email  = "882423486093-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = false
    enable_vtpm                 = true
  }

  zone = "us-east1-b"
}
