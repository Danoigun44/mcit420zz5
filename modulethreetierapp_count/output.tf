output "module_web_vm_public_ip" {
  value = azurerm_public_ip.web.*.ip_address
}
