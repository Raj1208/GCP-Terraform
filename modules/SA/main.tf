# ServiceAccount like IAM
resource "google_service_account" "my_service_account" {
  account_id   = "my-sa-1208"
  display_name = "My Service Account"
}

# Assign predefined roles directly
resource "google_project_iam_member" "example" {
  project = "my-project-id"
  role    = "roles/editor"
  member  = "serviceAccount:my-service-account@my-project-id.iam.gserviceaccount.com"
}

# Creating key for service account
resource "google_service_account_key" "ar-svc-key" {
  service_account_id = google_service_account.my_service_account.name
}

#Define custom roles

resource "google_project_iam_custom_role" "my_custom_role" {
  role_id     = "myCustomRole"
  title       = "My Custom Role"
  description = "A custom role for specific permissions"
  permissions = [
    "compute.instances.create",
    "compute.instances.delete",
  ]
  project = "my-project-id"
}

#  Apply policies to your resources

resource "google_project_iam_policy" "my_policy" {
  project = "my-project-id"
  policy_data = jsonencode({
    bindings = [
      {
        role    = "roles/viewer"
        members = [
          "user:example@example.com",
        ]
      },
    ]
  })
}
