resource "google_secret_manager_secret" "ar-svc-secret" {

  secret_id = "gcp-ar-access"

  replication {
    auto {}
  }
}

# # store files as Secret DATA
# resource "google_secret_manager_secret_version" "ar-svc-version" {
#   secret = google_secret_manager_secret.ar-svc-secret.id

#   secret_data = var.file
# }

# store key=value for SECRET
resource "google_secret_manager_secret_version" "my_secret_version" {
  secret = google_secret_manager_secret.ar-svc-secret.id
   secret_data = jsonencode({
    "DATABASE_URL" = "postgres://user:password@host:port/dbname"
    "API_KEY"      = "your-api-key"
    "SECRET_KEY"   = "your-secret-key"
  })
}