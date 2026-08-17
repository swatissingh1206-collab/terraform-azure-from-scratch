terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.81.0"
    }
  }
  required_version = ">= 1.8.0"

  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "sttfstate54321"
    container_name       = "tfstate"
    key                  = "prod.terraform.tfstate"
  }
}
