terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  alias           = "tenantA"
  features        {}
  subscription_id = "68091150-801e-4498-8be2-e5d4bcf9919c"
  tenant_id       = "a7f199fe-ccac-4034-bf7c-edf69cd52686"
  client_id       = "56ba212c-a483-4331-81c9-4c7d41a71719"
  client_secret   = var.client_secret_a
}

provider "azurerm" {
  alias           = "tenantB"
  features        {}
  subscription_id = "8ff9452e-28f7-4172-ab48-6b107868a2c7"
  tenant_id       = "a34fb0ab-b8f1-47ab-9503-a6e095a8b3d5"
  client_id       = "d772b448-061d-4c3e-a3a2-cdd0afb90d16"
  client_secret   = var.client_secret_b
}