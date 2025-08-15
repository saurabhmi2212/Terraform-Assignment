variable "update_config_name" {
  description = "The name for the software update configuration"
  type        = string
}

variable "automation_account_id" {
  description = "The ID of the Automation Account"
  type        = string
}

variable "virtual_machine_ids" {
  description = "A list of virtual machine resource IDs to target"
  type        = list(string)
}

variable "start_time" {
  description = "The start time for the weekly update schedule (e.g., '2023-10-27T10:00:00Z')"
  type        = string
}
