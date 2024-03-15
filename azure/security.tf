##################### Network security groups ###########################
resource "azurerm_network_security_group" "bastionnsg" {
  name                = "bastionnsg"
  location            = azurerm_resource_group.Dev_RG.location
  resource_group_name = azurerm_resource_group.Dev_RG.name
  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

############## Attached Network Security Group at Network Interface level #####################
resource "azurerm_network_interface_security_group_association" "bastion_nic_nsg" {
  network_interface_id      = azurerm_network_interface.bastionnic.id
  network_security_group_id = azurerm_network_security_group.bastionnsg.id
}