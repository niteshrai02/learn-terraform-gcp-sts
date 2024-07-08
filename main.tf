module "google_storage_transfer_job" {
 source = "./modules/google-storage-transfer-service-job" 

 transfer_job_description = "niteshtransferjobbucket1"
 project = "identitytestnitesh"
 bucket_name = "niteshpoctestbucket"
}

module "google_storage_transfer_agent_pool" {
  source = "./modules/google-transfer-agent-pool"
  storage-transfer-agent-name = "agentvinod"
  storage-transfer-agent-display-name = "agentvinod007"
}