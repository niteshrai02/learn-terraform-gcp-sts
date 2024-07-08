variable "project" {
  type = string
  default = "identitytestnitesh"
}

variable "bucket_name" {
  type = string
  default = "niteshpoctestbuc"
}

variable "storage_class" {
  type = string
  default = "NEARLINE"
}

variable "location" {
  type = string
  default = "US"
}

variable "transfer_job_description" {
  type = string
  default = "niteshtransferjobbucket"
}
variable "schedule_start_date_year" {
  type = number
  default = 2024
}
variable "schedule_start_date_month" {
  type = number
  default = 10
}
variable "schedule_start_date_day" {
  type = number
  default = 1
}