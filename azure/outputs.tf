output "bastionhost_public_ip" {
  value = "ssh azure-user@${azurerm_linux_virtual_machine.bastion.public_ip_address}"
}