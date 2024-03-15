output "bastionhost_public_ip" {
  ssh azure-user@${azurerm_linux_virtual_machine.bastion.public_ip_address}"
}