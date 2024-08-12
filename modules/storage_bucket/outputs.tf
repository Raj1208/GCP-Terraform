output "bucket_name" {
  value = google_storage_bucket.bucket.name
}

output "bucket_location" {
  value = google_storage_bucket.bucket.location
}
output "url" {
  description = "The base URL of the bucket, in the format gs://<bucket-name>"
  value       = google_storage_bucket.bucket.url
}



