variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}

variable "nsg_id" {
  description = "The ID of the network security group"
  type        = string
}

variable "public_key" {
  description = "The SSH public key for the VM"
  type        = string
  sensitive   = true
}

variable "custom_data" {
  description = "The cloud-init script for VM customization"
  type        = string
}
