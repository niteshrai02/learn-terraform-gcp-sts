module "google_storage_transfer_job" {
 source = "./modules/google-storage-transfer-service-job" 

 transfer_job_description = "niteshtransferjobbucket1"
 project = "identitytestnitesh"
 source_bucket_name = "sourcejobbucket"
 target_bucket_name = "targetjobbucket"
 schedule_start_date = {
  year = 2024
  month = 7
  day = 24
 }
}

module "google_storage_transfer_agent_pool" {
  source = "./modules/google-transfer-agent-pool"
  storage-transfer-agent-name = "agentvinod"
  storage-transfer-agent-display-name = "agentvinod007"
}