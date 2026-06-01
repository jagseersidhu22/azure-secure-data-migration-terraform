resource "azurerm_resource_group" "rg_a" {
  name     = "rg-tenantA"
  location = "Australia East"

  provider = azurerm.tenantA
}

resource "azurerm_storage_account" "st_a" {
  name                     = "sttenantaa001"
  resource_group_name     = azurerm_resource_group.rg_a.name
  location                = azurerm_resource_group.rg_a.location
  account_tier            = "Standard"
  account_replication_type = "LRS"

  provider = azurerm.tenantA
}

resource "azurerm_resource_group" "rg_b" {
  name     = "rg-tenantB"
  location = "Australia East"

  provider = azurerm.tenantB
}

resource "azurerm_storage_account" "st_b" {
  name                     = "sttenantbb001"
  resource_group_name     = azurerm_resource_group.rg_b.name
  location                = azurerm_resource_group.rg_b.location
  account_tier            = "Standard"
  account_replication_type = "LRS"

  provider = azurerm.tenantB
}

resource "azurerm_virtual_network" "vnet_a" {

 name                = "vnet-tenantA"
  resource_group_name = azurerm_resource_group.rg_a.name
  location            = azurerm_resource_group.rg_a.location
  address_space       = ["10.0.0.0/16"]
  provider = azurerm.tenantA
}

resource "azurerm_subnet" "subnet_a" {
  name                 = "subnet-tenantA"
  resource_group_name  = azurerm_resource_group.rg_a.name
  virtual_network_name = azurerm_virtual_network.vnet_a.name
  address_prefixes     = ["10.0.1.0/24"]

  provider = azurerm.tenantA
}


resource "azurerm_private_endpoint" "pe_a" {
  name                = "pe-tenantA"
  resource_group_name = azurerm_resource_group.rg_a.name
  location            = azurerm_resource_group.rg_a.location
  subnet_id           = azurerm_subnet.subnet_a.id


  private_service_connection {
    name                           = "psc-tenantA"
    is_manual_connection            = false
    private_connection_resource_id   = azurerm_storage_account.st_a.id
    subresource_names                = ["blob"]
  }

  provider = azurerm.tenantA
  
}