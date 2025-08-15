terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# --- Cloud-init script for NGINX installation
resource "local_file" "cloud_init" {
  filename        = "cloud-init.yaml"
  content         = <<-EOT
  #cloud-config
  package_upgrade: true
  packages:
    - nginx
  runcmd:
    - systemctl start nginx
    - systemctl enable nginx
  EOT
}

# --- Module calls
module "network" {
  source                = "./modules/network"
  resource_group_name   = var.resource_group_name
  location              = var.location
  vnet_name             = var.vnet_name
  vnet_address_space    = var.vnet_address_space
  subnet_name           = var.subnet_name
  subnet_address_prefixes = var.subnet_address_prefixes
}

module "nsg" {
  source              = "./modules/nsg"
  nsg_name            = var.nsg_name
  location            = module.network.location
  resource_group_name = module.network.resource_group_name
}

module "vm" {
  source              = "./modules/vm"
  vm_name             = var.vm_name
  location            = module.network.location
  resource_group_name = module.network.resource_group_name
  subnet_id           = module.network.subnet_id
  nsg_id              = module.nsg.nsg_id
  public_key          = var.public_key
  custom_data         = local_file.cloud_init.content
}


# Placeholder for a VM ID - replace with a real VM resource
resource "null_resource" "placeholder_vm" {
  provisioner "local-exec" {
    command = "echo 'Creating a placeholder for a VM ID...'"
  }
}

locals {
  vm_id = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/example-rg/providers/Microsoft.Compute/virtualMachines/example-vm"
}

module "log_analytics" {
  source              = "./modules/log_analytics"
  workspace_name      = "example-law"
  location            = "eastus"
  resource_group_name = "example-rg"
}

module "automation" {
  source                     = "./modules/automation"
  automation_account_name    = "example-automation-account"
  location                   = module.log_analytics.location
  resource_group_name        = module.log_analytics.resource_group_name
  log_analytics_workspace_id = module.log_analytics.id
}

module "update_management" {
  source                = "./modules/update_management"
  update_config_name    = "weekly-linux-patching"
  automation_account_id = module.automation.id
  virtual_machine_ids   = [locals.vm_id]
  start_time            = "2025-08-16T10:00:00Z" #  need to set a future time
}
