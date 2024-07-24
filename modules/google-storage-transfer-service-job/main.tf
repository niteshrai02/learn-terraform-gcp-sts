data "google_storage_transfer_project_service_account" "default" {
  project = var.project
}

resource "google_storage_bucket" "source-gcp-bucket" {
  name          = var.source_bucket_name
  storage_class = var.storage_class
  project       = var.project
  location      = var.location
}

resource "google_storage_bucket" "target-gcp-bucket" {
  name          = var.target_bucket_name
  storage_class = var.storage_class
  project       = var.project
  location      = var.location
}

resource "google_storage_bucket_iam_member" "source-gcp-bucket-iam" {
  bucket     = google_storage_bucket.source-gcp-bucket.name
  role       = "roles/storage.admin"
  member     = "serviceAccount:${data.google_storage_transfer_project_service_account.default.email}"
  depends_on = [google_storage_bucket.source-gcp-bucket]
}

resource "google_storage_bucket_iam_member" "target-gcp-bucket-iam" {
  bucket     = google_storage_bucket.target-gcp-bucket.name
  role       = "roles/storage.admin"
  member     = "serviceAccount:${data.google_storage_transfer_project_service_account.default.email}"
  depends_on = [google_storage_bucket.target-gcp-bucket]
}


resource "google_storage_transfer_job" "gcp-bucket-transfer-job" {
  description = var.transfer_job_description
  project     = var.project

  transfer_spec {
    
    gcs_data_sink {
      bucket_name = google_storage_bucket.target-gcp-bucket.name
      
    }
    gcs_data_source {
      bucket_name = google_storage_bucket.source-gcp-bucket.name   
    }
  }

  schedule {
    schedule_start_date {
      year = var.schedule_start_date["year"]
      month = var.schedule_start_date["month"]
      day = var.schedule_start_date["day"]
    }
    schedule_end_date {
      year  = 2025
      month = 1
      day   = 15
    }
    repeat_interval = "604800s"
  }
  depends_on = [google_storage_bucket_iam_member.source-gcp-bucket-iam, google_storage_bucket_iam_member.target-gcp-bucket-iam]
}
