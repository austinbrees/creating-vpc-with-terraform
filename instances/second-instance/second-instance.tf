data "google_compute_image" "image_family_eu" {
  family  = "debian-9"
  project = "debian-cloud"
}

resource "google_compute_instance" "eu_instance" {
  name         = "mynet-eu-vm"
  machine_type = "e2-micro"
  zone         = "europe-west1-c"

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/debian-11-bullseye-v20230509
    }
  }

  network_interface {
    network = "default"
  }
}

resource "google_compute_disk_snapshot" "eu_snapshot" {
  name        = "second-vm-snapshot"
  source_disk = google_compute_instance.eu_instance.boot_disk[0].source
  zone        = "europe-west1-c"
}

resource "google_compute_image" "eu_vm_image" {
  name        = "second-vm"
  source_disk = "https://www.googleapis.com/compute/v1/projects/${var.project_id}/zones/europe-west1-c/disks/${google_compute_instance.eu_instance.name}"
}
