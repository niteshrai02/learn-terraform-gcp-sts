data "google_storage_transfer_project_service_account" "default" {
  project = var.project
}

resource "google_project_iam_member" "pubsub_editor_role" {
  project = var.project
  role    = "roles/pubsub.editor"
  member  = "serviceAccount:${data.google_storage_transfer_project_service_account.default.email}"
}

resource "google_storage_transfer_agent_pool" "storage-transfer-agent" {
  name = var.storage-transfer-agent-name
  project = var.project
  display_name = var.storage-transfer-agent-display-name
  bandwidth_limit {
    limit_mbps = "120"
  }

  depends_on = [google_project_iam_member.pubsub_editor_role]
}