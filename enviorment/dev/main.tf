module "resource_group" {
  source = "../../modules/azurerm_rg"
  rgs    = var.rgs
}

module "vnets" {
  source     = "../../modules/azurerm_vnet"
  vnet       = var.vnet
  depends_on = [module.resource_group]

}

module "subnet" {
  source     = "../../modules/azurerm_subnet"
  subnet     = var.subnet
  depends_on = [module.vnets]
}

module "public_ip" {
  source     = "../../modules/azurerm_pip"
  pip        = var.pip
  depends_on = [module.resource_group]
}

module "nicard" {
  source     = "../../modules/azurerm_nic"
  nic        = var.nic
  depends_on = [module.subnet]
}

module "vm_linux" {
  source = "../../modules/azurerm_vm"
  vms    = var.vms

}