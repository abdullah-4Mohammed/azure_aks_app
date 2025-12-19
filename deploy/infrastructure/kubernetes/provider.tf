terraform {
    //required_version = "1.6.0"
    required_version = ">=1.3"  # ← Change to flexible

    required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        //version = "3.75.0"
        version = "~>3.0"  # ← Change to flexible
        
      }
    }
}

provider "azurerm" {
  features {    
  }
}