variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "web-server-rg"
}

variable "location" {
  description = "The Azure region"
  type        = string
  default     = "eastus"
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "web-server-vnet"
}

variable "vnet_address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
  default     = "web-server-subnet"
}

variable "subnet_address_prefixes" {
  description = "The address prefixes for the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "nsg_name" {
  description = "The name of the network security group"
  type        = string
  default     = "web-server-nsg"
}

variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
  default     = "web-server-vm"
}

variable "public_key" {
  description = "The SSH public key for the VM"
  type        = string
  sensitive   = true 
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDRXz+R0UHkt3AjHIqLgfcGZeQZRE71jlE11F2Z4sWH/BNjrcSK0m1oWAiT4vWF21NH4S+y5EczYIH7ectTaTlTaBiPAFZ7MeiLnGsr6Kz5JwhLG+A2xTyI2+Yi31sPKU2KllhedK+oCRV+zLh460dFL1+sMgRhPRmtUc831UvHt44zlaMVLCt147ecxHD7M3jbrgYzn0zK/SvDXYdsDCe2mQGgJ2jaU5FQcWbObubFYMvTwwHVxdiy/E3wTbeD5xHNZ2pgTRTEyn1VOYZVIIgrMXU+exs7NmR9vyS7gEUWo0hGY/MXzR5nVjFLtEMrETrDanUqvetfmSi7KVnclhOJ skm.jss@gmail.com"
 
}
