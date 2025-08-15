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
