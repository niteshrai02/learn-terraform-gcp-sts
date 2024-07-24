variable "project" {
  type = string
  default = "identitytestnitesh"
}

variable "source_bucket_name" {
  type = string
}

variable "target_bucket_name" {
  type = string
}

variable "storage_class" {
  type = string
  default = "STANDARD"
}

variable "location" {
  type = string
  default = "US"
}

variable "transfer_job_description" {
  type = string
  default = "niteshtransferjobbucket"
}
variable "schedule_start_date" {
  type = map(number)
}
variable "schedule_start_date_month" {
  type = number
  default = 10
}
variable "schedule_start_date_day" {
  type = number
  default = 1
}