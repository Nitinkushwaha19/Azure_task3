variable "windows_web_app_name" {
  type        = string
  description = "The name of the web app."
}

variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

variable "service_plan_id" {
  type = string
}

# dynamic block variable
variable "ip_restrictions" {
  description = "List of IP restriction rules"
  type = list(object({
    name        = string
    priority    = number
    action      = string
    ip_address  = optional(string)
    service_tag = optional(string)
  }))
}

# tags
variable "tags" {
  type = map(string)
}
