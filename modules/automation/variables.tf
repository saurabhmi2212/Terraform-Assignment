variable "automation_account_name" {
  description = "The name of the Automation Account"
  type        = string
}

variable "location" {
  description = "The Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics Workspace to link"
  type        = string
}
