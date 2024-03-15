#################### Azure Virtual Machine: Linux based bastionhost #########################
 resource "azurerm_linux_virtual_machine" "bastion" {
   name                  = "bastionhost"
   location              = azurerm_resource_group.Dev_RG.location
   resource_group_name   = azurerm_resource_group.Dev_RG.name
   network_interface_ids = [azurerm_network_interface.bastionnic.id]
   size                = "Standard_F2"
   admin_username      = "azure-user"
    source_image_reference {
      publisher = "Canonical"
      offer     = "UbuntuServer"
      sku       = "16.04-LTS"
      version   = "latest"
    } 
  #source_image_reference {
  #   publisher = "OpenLogic"
  #   offer     = "CentOS"
  #   sku       = "7_9"
  #   version   = "latest"
  # }
  admin_ssh_key {
    username   = "azure-user"
    public_key = "${var.mykey}"
  }
  os_disk {
    name = "bastion-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

   /* connection {
         host = self.public_ip_address
         user = "adminuser"
         type = "ssh"
         private_key = "${file("~/Downloads/mykp.pem")}"
         timeout = "4m"
         agent = false
     }
   provisioner "remote-exec" {
         inline = [
       "sudo apt update",

       "sudo apt install docker.io -y"
         ]
     } */
 }