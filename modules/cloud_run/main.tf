resource "google_cloud_run_service" "cloud_run_service" {
  name     = var.service_name
  location = var.region

  template {
    spec {
      containers {
        image = var.image
        ports {
          container_port = 80
        }
      }
    }
  }

  traffics {
    latest_revision = true
    percent         = 100
  }
}