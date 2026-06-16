module "vm" {
  source  = "Azure/avm-res-compute-virtualmachine/azurerm"
  version = "0.21.0"

  location            = var.location
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  zone                = var.zone
  os_type             = "Linux"
  sku_size            = var.vm_size
  enable_telemetry    = false
  encryption_at_host_enabled = false

  network_interfaces = {
    nic1 = {
      name = "${var.vm_name}-nic-${var.suffix}"
      ip_configurations = {
        ip1 = {
          name                          = "internal"
          private_ip_subnet_resource_id = var.subnet_id
        }
      }
      network_security_groups = {
        nsg1 = {
          network_security_group_resource_id = var.nsg_id
        }
      }
    }
  }

  source_image_reference = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_disk = {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  account_credentials = {
    admin_credentials = {
      username = var.admin_username
      ssh_keys = []
      generate_admin_password_or_ssh_key = true
    }
  }
}
