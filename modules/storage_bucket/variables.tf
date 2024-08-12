variable "bucket_name" {
  description = "The name of the storage bucket."
  type        = string
}

variable "location" {
  description = "The location of the storage bucket."
  type        = string

}
variable "storage_class" {

  type = string

}
variable "public_access_prevention" {
  description = "Prevents public access to the bucket."
  type        = string
  default     = "inherited"
}


variable "versioning" {
  type = string
}

# variable "main_page_suffix" {
#   description = "The suffix of the main page for the website configuration."
#   type        = string

# }

# variable "not_found_page" {
#   description = "The page to serve for 404 errors."
#   type        = string

# }
