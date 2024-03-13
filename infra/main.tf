terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.94.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "explore_azure_ai_rg" {
  name     = "explore-azure-ai"
  location = "southeastasia"
}

resource "azurerm_cognitive_account" "explore_azure_ai_cognitive" {
  name                = "computer-vision-account-leo-1"
  location            = azurerm_resource_group.explore_azure_ai_rg.location
  resource_group_name = azurerm_resource_group.explore_azure_ai_rg.name
  kind                = "ComputerVision"

  sku_name = "F0"

  tags = {
    Environment = "Test"
  }
}