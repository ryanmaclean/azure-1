# Dev environment.
# NOTE: If environment copied, change environment related values (e.g. "dev" -> "perf").

##### Terraform configuration #####

terraform {
  backend "azurerm" {
    storage_account_name  = "kariaksstorage"
    container_name        = "dev-kari-aks-terraform-container"
    key                   = "terraform.tfstate"
  }
}


# Here we inject our values to the environment definition module which creates all actual resources.
module "env-def" {
  source   = "../modules/env-def"
  prefix   = "karissaks"
  env      = "dev"
  location = "westeurope"
}