variable "project" {
  description = "Project"
  default     = "project-aae07d62-af88-460f-8cb"
}

variable "region" {
  description = "Region"
  default     = "us-centrall"
}

variable "location" {
  description = "Project location"
  default     = "US"
}

variable "bq_dataset_name" {
  description = "My BigQuery dataset name"
  default     = "demo_dataset"
}

variable "gcs_bucket_name" {
  description = "My Storage bucket name"
  default     = "my-demo-bucket-030903"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}