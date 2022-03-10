terraform{
    required_providers {
    #   azurerm={
    #       source="hashicoro/azurerm"
    #     #   version="2.98.0"
    #   }
    }
}
provider "azurerm" {
    features {}
    
  
}
resource "azurerm_resource_group" "manisha" {
    name="mt_tf_manisha"
    location ="central india"
  
}
resource "azurerm_app_service_plan" "verma" {
    name="my_tf_verma"
    resource_group_name= azurerm_resource_group.manisha.name
    location= azurerm_resource_group.manisha.location 
    sku{
        tier ="standard"
        size="s1"
    }
    
}
resource "azurerm_app_service" "manishaverma" {
     name                = "manishaverma-app-service"
  location            = azurerm_resource_group.manisha.location
  resource_group_name = azurerm_resource_group.manisha.name
  app_service_plan_id = azurerm_app_service_plan.verma.id

  
}
resource "azurerm_storage_account" "manisha001" {
  name                     = "storageaccountmanisha001"
  resource_group_name      = azurerm_resource_group.manisha.name
  location                 = azurerm_resource_group.manisha.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "staging"
  }
}
