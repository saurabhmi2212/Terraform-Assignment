output "public_ip_address" {
  description = "The public IP address of the Linux VM"
  value       = module.vm.public_ip_address
}
