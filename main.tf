

data "google_storage_transfer_project_service_account" "default" {
  project = var.project
}

resource "google_storage_bucket" "gcp-bucket" {
  name          = var.bucket_name
  storage_class = var.storage_class
  project       = var.project
  location      = var.location
}

resource "google_storage_bucket_iam_member" "gcp-bucket" {
  bucket     = google_storage_bucket.gcp-bucket.name
  role       = "roles/storage.admin"
  member     = "serviceAccount:${data.google_storage_transfer_project_service_account.default.email}"
  depends_on = [google_storage_bucket.gcp-bucket]
}



resource "google_storage_transfer_job" "gcp-bucket-transfer-job" {
  description = var.transfer_job_description
  project     = var.project

  transfer_spec {
    
    gcs_data_sink {
      bucket_name = google_storage_bucket.gcp-bucket.name
      
    }
    gcs_data_source {
      bucket_name = google_storage_bucket.gcp-bucket.name   
    }
  }

  schedule {
    schedule_start_date {
      year  = 2024
      month = 10
      day   = 1
    }
    schedule_end_date {
      year  = 2025
      month = 1
      day   = 15
    }
    start_time_of_day {
      hours   = 23
      minutes = 30
      seconds = 0
      nanos   = 0
    }
    repeat_interval = "604800s"
  }
  depends_on = [google_storage_bucket_iam_member.gcp-bucket]
}
