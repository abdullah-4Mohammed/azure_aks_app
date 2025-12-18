terraform {
  backend "azurerm" {
    container_name = " "
    key = "  "
    resource_group_name = ""
    storage_account_name = ""
  }
}


# terraform {
#   backend "azurerm" {
#     container_name = "platformstate"
#     key = "${var.state_file_key}" #"./platform.tfstate"
#     resource_group_name = "dlab-dia-shared-uks-rg"
#     storage_account_name = "dia23tfstatestor"
#   }
# }
