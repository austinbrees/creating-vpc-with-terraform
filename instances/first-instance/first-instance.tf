data "google_compute_image" "image_family" {
  family  = "debian-9"
  project = "debian-cloud"
}

resource "google_compute_instance" "default" {
  name         = "mynet-us-vm"
  machine_type = "e2-micro"
  zone         = "us-east1-c"

  boot_disk {
    initialize_params {
      image = "projects/debian-cloud/global/images/debian-11-bullseye-v20230509
    }
  }

  network_interface {
    network = "default"
  }
}

resource "google_compute_disk_snapshot" "default" {
  name        = "first-vm-snapshot"
  source_disk = google_compute_instance.default.boot_disk[0].source
  zone        = "us-east1-c"
}

resource "google_compute_image" "vm_image" {
  name        = "first-vm"
  source_disk = "https://www.googleapis.com/compute/v1/projects/${var.project_id}/zones/us-east1-c/disks/${google_compute_instance.default.name}"
}
