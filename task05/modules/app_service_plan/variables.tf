variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "app_service_plan_name" {
  description = "The name of the app service plan"
  type        = string
}

variable "os_type" {
  description = "The operating system type of the app service plan"
  type        = string
  default     = "Windows"
}

variable "sku_name" {
  description = "The SKU name of the app service plan"
  type        = string
  default     = "S1"
}


variable "worker_count" {
  type        = number
  description = "The number of the worker instance in the asp"
}

variable "tags" {
  type = map(string)
}
