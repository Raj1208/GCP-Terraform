resource "google_sql_database_instance" "mysql_pvp_instance_name" {
  name             = "mysql-pvp-instance-name"
  region           = "asia-northeast1"
  database_version = "MYSQL_8_0"
  root_password    = "abcABC123!"
  settings {
    tier = "db-f1-micro"
     ip_configuration {
      authorized_networks {
        name = "MyAuthorizedNetwork"
        value = "103.215.158.90/32"  # Restrict access to this IP only
      }
    }
    # password_validation_policy {
    #   min_length                  = 6
    #   complexity                  = "COMPLEXITY_DEFAULT"
    #   reuse_interval              = 2
    #   disallow_username_substring = true
    #   enable_password_policy      = true
    # }
  }
  # set `deletion_protection` to true, will ensure that one cannot accidentally delete this instance by
  # use of Terraform whereas `deletion_protection_enabled` flag protects this instance at the GCP level.
  deletion_protection = false
}

resource "google_sql_database" "database" {
  name     = "my-database"
  instance = google_sql_database_instance.mysql_pvp_instance_name.name
}

resource "google_sql_user" "MYSQL_user" {
  name     = "root"
  instance = google_sql_database_instance.mysql_pvp_instance_name.name
  password = "root"
}

resource "google_compute_firewall" "allow_mysql" {
  name    = "allow-mysql"
  network = "default"  # Replace with your network name

  allow {
    protocol = "tcp"
    ports    = ["3306"]  # Default MySQL port
  }

  source_ranges = ["103.215.158.90/32"]  # Restrict access to this IP only
}

