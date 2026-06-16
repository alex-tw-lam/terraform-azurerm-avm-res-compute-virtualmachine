output "resource_id" {
  value = module.vm.resource_id
}

output "name" {
  value = module.vm.name
}

output "virtual_machine_azurerm" {
  value = jsonencode(module.vm.virtual_machine_azurerm)
}

output "admin_username" {
  value = module.vm.admin_username
}

output "resource_group_name" {
  value = var.resource_group_name
}

output "admin_generated_ssh_private_key" {
  value     = module.vm.admin_generated_ssh_private_key
  sensitive = true
}

output "public_ip_address" {
  value = module.vm.virtual_machine_azurerm.public_ip_address
}

output "private_ip_address" {
  value = module.vm.virtual_machine_azurerm.private_ip_address
}
