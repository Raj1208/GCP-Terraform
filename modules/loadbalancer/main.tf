resource "google_compute_global_address" "service-lb-ip" {
  name = "${local.image-name}-lb-ip"
}

resource "google_compute_region_network_endpoint_group" "serverless-neg" {
  name                  = "${local.image-name}-serverless-neg"
  network_endpoint_type = "SERVERLESS"
  region                = var.region
  cloud_run {
    service = google_cloud_run_service.service.name
  }
}

resource "google_compute_security_policy" "security-policy" {
  name = "${local.image-name}-security"

  rule {
    action   = "allow"
    priority = "1000"
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = local.ip.authorized
      }
    }
    description = "Allow access to authorized IPs only"
  }

  rule {
    action   = "deny(403)"
    priority = "2147483647"
    match {
      versioned_expr = "SRC_IPS_V1"
      config {
        src_ip_ranges = ["*"]
      }
    }
    description = "default deny rule"
  }
}