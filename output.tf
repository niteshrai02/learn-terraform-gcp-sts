output "bucket_name" {
  value = google_storage_bucket.gcp-bucket.name
}
output "transfer_job" {
  value = google_storage_transfer_job.gcp-bucket-transfer-job.description
}