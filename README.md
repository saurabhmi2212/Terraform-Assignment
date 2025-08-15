

# <h1>Azure Infrastructure with Automated Patch Management </h1>



## This repository contains modular Terraform code to provision a complete Azure environment, including a virtual machine (VM) with automated patch management, a network, and security configurations. The project is divided into a main patch management solution and a bonus challenge that combines all modules into a full-stack environment



##  Structure

```plaintext

.
├── modules
│   ├── network
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── nsg
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── vm
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── log_analytics
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── automation
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── update_management
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
└── README.md



### **Instructions**

**Initialize Terraform**: Navigate to the root directory of the project and initialize Terraform.

**terraform init**

**Plan the Deployment**: Review the execution plan to see what resources will be created.

**terraform plan**


**Apply the Configuration**: Deploy the infrastructure to Azure.

**terraform apply**



**Module Documentation**

network Module: Creates an Azure Resource Group, Virtual Network, and a Subnet.

Inputs: resource_group_name, location, vnet_name, vnet_address_space, subnet_name, subnet_address_prefixes.

Outputs: resource_group_name, location, vnet_id, subnet_id.

nsg Module: Creates an Azure Network Security Group with rules for SSH (port 22) and HTTP (port 80) access.

Inputs: nsg_name, location, resource_group_name.

Outputs: nsg_id.

vm Module: Creates a Linux Virtual Machine, Public IP, Network Interface, and associates it with the NSG. It uses a cloud-init script to install NGINX on boot.

Inputs: vm_name, resource_group_name, location, subnet_id, nsg_id, public_key, custom_data.

Outputs: public_ip_address

log_analytics :- This module creates a Log Analytics Workspace, which is a central repository for logs and metrics.

automation :-  This module sets up the Azure Automation Account, a prerequisite for Update Management

update_management :- This module configures the patch schedule and links it to the VM.


#### **Access the Web Server**: After the deployment is complete, Terraform will output the public IP address. Copy the IP and paste it into  web browser. We will see the default NGINX welcome page.

ssh azureuser@<public_ip_address>
sudo systemctl status nginx



#### **Bonus Challenge: Full Environment Using Modules**


This section combines all modules to deploy a complete, parameterized environment. The environment includes:

A Linux VM with NGINX installed via a cloud-init script.

A Virtual Network (VNet) and a Subnet for network isolation.

A Network Security Group (NSG) to secure the VM.

Azure Update Management to automatically patch the VM on a weekly schedule.



**Monitor Patch Management**: Visit the Azure Portal to check the Automation Account and Log Analytics Workspace to see the patch management configuration and compliance reports.

