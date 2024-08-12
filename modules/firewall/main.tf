
resource "google_compute_firewall" "allow_bastion_access" {
  name    = "allow-bastion-access"
  network = var.vpc_network

  allow {
    protocol = "tcp"
    ports    = ["22", "80" , "443"]  # Allow SSH access
  }

  source_ranges = ["0.0.0.0/0"]  # Allow access from anywhere
  target_tags   = ["bastion"]
}


resource "google_compute_firewall" "allow_bastion_to_private" {
  name    = "allow-bastion-to-private"
  network = var.vpc_network

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }

  source_tags   = ["bastion"]
  target_tags = ["private-instance"]
}


resource "google_compute_firewall" "allow_load_balancer_to_backend" {
  name    = "allow-load-balancer-to-backend"
  network = var.vpc_network

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]  # Adjust as needed
  }

  source_ranges = [var.load_balancer_ip]  # Replace with actual IP range of Load Balancer
  target_tags   = ["private-instance"]
}


resource "google_compute_firewall" "allow_db_access" {
  name    = "allow-db-access"
  network = var.vpc_network

  allow {
    protocol = "tcp"
    ports    = ["5432"]  # PostgreSQL default port
  }

  source_tags = ["bastion", "private-instance"]
  target_tags = ["postgres"]
}

# resource "google_compute_firewall" "deny_all_other" {
#   name    = "deny-all-other"
#   network = var.vpc_network

#   deny {
#     protocol = "all"
#   }

#   priority = 1000
#    source_ranges = ["0.0.0.0/0"]
#   target_tags = ["private-instance"]
# }

# resource "google_compute_firewall" "allow_load_balancer_health_checks" {
#   name    = "allow-load-balancer-health-checks"
#   network = var.vpc_network

#   allow {
#     protocol = "tcp"
#     ports    = ["80", "443"]  # Ports used by health checks
#   }

#   source_ranges = ["0.0.0.0/0"
#   ]

#   target_tags = ["private-instance"]
# }
