Store API keys, passwords, certificates, and other sensitive data.
Secret Manager provides a central place and single source of truth to manage, access, and audit secrets across Google Cloud.


With Secret Manager, you can store secrets centrally, rather than hardcoding them into your code or configuration files. This approach improves security by reducing the risk of accidental exposure or unauthorized access to sensitive information.

Assign the Secret Manager Admin role (roles/secretmanager.admin)

# create Secret

# Access Secret
gcloud secrets versions access <version-id> --secret="<secret-id>"

# stote into .env

gcloud secrets versions access latest --secret="gcp-ar-access" | jq -r 'to_entries | .[] | "\(.key)=\(.value)"' > .env

# use Secret in Compute Engine

resource "google_compute_instance_metadata_item" "my-secret" {
  provider = google-beta
  instance_name = google_compute_instance.my-instance.name
  key = "my-secret"
  value = google_secret_manager_secret.my-secret.replication_policy[0].automatic.value
}

# store base64 data
resource "google_secret_manager_secret_version" "secret-version-base64" {
  secret = google_secret_manager_secret.secret-basic.id

  is_secret_data_base64 = true
  secret_data = filebase64("secret-data.pfx")
}