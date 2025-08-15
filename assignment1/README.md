<h1>Instructions</h1>






**Generate an SSH Key**: Created SSH public key to access the VM.

ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa


**Initialize Terraform**: Navigate to the root directory of the project and initialize Terraform.

**terraform init**

**Plan the Deployment**: Review the execution plan to see what resources will be created.

**terraform plan**


**Apply the Configuration**: Deploy the infrastructure to Azure.

**terraform apply**

**Access the Web Server**: After the deployment is complete, Terraform will output the public IP address. Copy the IP and paste it into  web browser. We will see the default NGINX welcome page.


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


