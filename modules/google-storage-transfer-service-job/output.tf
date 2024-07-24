output "transfer_job" {
  value = google_storage_transfer_job.gcp-bucket-transfer-job.description
}

output "default_account" {
  value=data.google_storage_transfer_project_service_account.default.email
}