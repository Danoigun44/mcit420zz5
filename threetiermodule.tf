module "three_tier_app" {
  source              = "./modulethreetierapp/"
  resource_group_name = "mcitthreetiermodule"
  location            = "West Europe"
  admin_username      = var.administrator_login
  admin_password      = var.administrator_login_password
  db_admin_username   = var.db_admin_username
  db_admin_password   = var.db_admin_password
}

output "module_web_vm_public_ip" {
  value = module.three_tier_app.module_web_vm_public_ip
}

module "three_tier_app_count" {
  source              = "./modulethreetierapp_count/"
  resource_group_name = "mcitthreetiermodule"
  location            = "West Europe"
  admin_username      = var.administrator_login
  admin_password      = var.administrator_login_password
  db_admin_username   = var.db_admin_username
  db_admin_password   = var.db_admin_password

  count               = var.instance_count
}

output "module_web_vm_public_ip" {
  value = [for i in range(var.instance_count) : module.three_tier_app[i].module_web_vm_public_ip]
}
