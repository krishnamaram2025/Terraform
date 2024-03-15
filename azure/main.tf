############### Specify the version of the AzureRM Provider to use ###############
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=3.0.1"
    }
  }
}

############ Configure the AzureRM Provider ######################################
provider "azurerm" {
  features {
     resource_group {
       prevent_deletion_if_contains_resources = false
     }
     key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

# Resource Group
resource "azurerm_resource_group" "Dev_RG" {
  name     = "Dev-RG"
  location = "${var.mylocation}"
}