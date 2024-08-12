variable "credentials_file" {
  description = "Path to the JSON file containing Google Cloud service account credentials"
  type        = string
}

variable "project_id" {
  description = "The ID of the Google Cloud project"
  type        = string
}

variable "region" {
  description = "The region to create the PostgreSQL instance in"
  type        = string
}


