resource_group_name = "full-environment-rg"
location            = "eastus"
vm_size             = "Standard_B1s"
public_key          = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDRXz+R0UHkt3AjHIqLgfcGZeQZRE71jlE11F2Z4sWH/BNjrcSK0m1oWAiT4vWF21NH4S+y5EczYIH7ectTaTlTaBiPAFZ7MeiLnGsr6Kz5JwhLG+A2xTyI2+Yi31sPKU2KllhedK+oCRV+zLh460dFL1+sMgRhPRmtUc831UvHt44zlaMVLCt147ecxHD7M3jbrgYzn0zK/SvDXYdsDCe2mQGgJ2jaU5FQcWbObubFYMvTwwHVxdiy/E3wTbeD5xHNZ2pgTRTEyn1VOYZVIIgrMXU+exs7NmR9vyS7gEUWo0hGY/MXzR5nVjFLtEMrETrDanUqvetfmSi7KVnclhOJ skm.jss@gmail.com"
tags = {
  Environment = "Dev"
  Project     = "Webserver"
}

# Network Configuration
vnet_address_space    = ["10.0.0.0/16"]
subnet_address_prefixes = ["10.0.1.0/24"]

# Patch Management Configuration
start_time = "2025-08-16T10:00:00Z"
