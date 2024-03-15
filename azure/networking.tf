############# Virtual Network ######################
resource "azurerm_virtual_network" "Dev_VNet" {
  name                = "Dev-VNet"
  resource_group_name = azurerm_resource_group.Dev_RG.name
  location            = azurerm_resource_group.Dev_RG.location
  address_space       = ["10.0.0.0/16"]
}
################## Subnets ###########################
resource "azurerm_subnet" "public_subnet1" {
  name                 = "public-subnet1"
  resource_group_name  = azurerm_resource_group.Dev_RG.name
  virtual_network_name = azurerm_virtual_network.Dev_VNet.name
  address_prefixes     = ["10.0.1.0/24"]
}

################# Route Tables ###############
resource "azurerm_route_table" "public_route_table" {
  name                          = "public-route-table"
  location            = azurerm_resource_group.Dev_RG.location
  resource_group_name = azurerm_resource_group.Dev_RG.name
  disable_bgp_route_propagation = false
  route {
    name           = "default"
    address_prefix = "0.0.0.0/0"
    next_hop_type  = "Internet"
  }
}
resource "azurerm_subnet_route_table_association" "pbrtba1" {
  subnet_id      = azurerm_subnet.public_subnet1.id
  route_table_id = azurerm_route_table.public_route_table.id
}

################# Public ips and Network Interfaces for Linux based Bastion host #####################3
# resource "azurerm_public_ip" "bastionpip" {
#   name                =  "bastionpip"
#   location            =  azurerm_resource_group.Dev_RG.location
#   resource_group_name =  azurerm_resource_group.Dev_RG.name
#   allocation_method   = "Dynamic"
# }
resource "azurerm_network_interface" "bastionnic" {
  name                = "bastionnic"
  location            = azurerm_resource_group.Dev_RG.location
  resource_group_name = azurerm_resource_group.Dev_RG.name

  ip_configuration {
    name                          = "bastionconfig"
    subnet_id                     = azurerm_subnet.public_subnet1.id
    private_ip_address_allocation = "Dynamic"
    # public_ip_address_id = azurerm_public_ip.bastionpip.id
  }
}
