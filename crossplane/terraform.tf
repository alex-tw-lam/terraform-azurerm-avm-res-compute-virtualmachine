terraform {
  required_version = ">= 1.10, < 2.0"
  required_providers {
    azurerm = { source = "hashicorp/azurerm", version = ">= 3.116, < 5.0" }
    azapi   = { source = "Azure/azapi",       version = "~> 2.0" }
    random  = { source = "hashicorp/random",   version = ">= 3.6.2, < 4.0.0" }
    tls     = { source = "hashicorp/tls",     version = "~> 4.0" }
  }
  backend "kubernetes" {
    in_cluster_config = true
    namespace         = "crossplane-system"
  }
}
