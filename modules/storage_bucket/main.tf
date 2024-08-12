
resource "google_storage_bucket" "bucket" {
  name     = var.bucket_name
  location = var.location
  storage_class = var.storage_class #  Set to a specific region or multi-region



  website {
    main_page_suffix = "index.html"
    # not_found_page   = var.not_found_page
  }
# Dual-region configuration   location_type = "DUAL_REGION"
# Multi-region location="Us"
uniform_bucket_level_access = false

  # Optionally, set the bucket to not be publicly accessible
  #public_access_prevention = var.public_access_prevention

    versioning {
    enabled = var.versioning
  }

  # Allow deletion of non-empty buckets
  force_destroy = true

}
resource "google_storage_bucket_iam_member" "public_access" {
  bucket = google_storage_bucket.bucket.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}

# resource "google_storage_bucket_object" "index_html" {
#   name   = "index.html"
#   bucket = google_storage_bucket.bucket.name
#   source = "dist/index.html"
# }

# resource "google_storage_bucket_object" "erro_html" {
#   name   = "404.html"
#   bucket = google_storage_bucket.bucket.name
#   source = "${path.module}/404.html"
# }