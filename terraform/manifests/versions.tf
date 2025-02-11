terraform {
  required_version = ">=1.5.6" # Minor version upgrades are allowed
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.3.0"
    }

    # random = {
    #   source  = "hashicorp/random"
    #   version = ">=3.6.0"
    # }
  }
  # Nothing should be configured here in backend block as the detils will be passed via Azure DevOps pipeline
  backend "azurerm" {
    storage_account_name = "terraformstatestore0"
    resource_group_name  = "terraform-storageAcc-rg"
    container_name       = "tfstatefiles"
    key                  = "particle41.tfstate"
    # subscription_id is being pulled from backen-config.tfvars file at the time of initialization
  }

}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id # refering the subscription id from terraform.tfvars
}
