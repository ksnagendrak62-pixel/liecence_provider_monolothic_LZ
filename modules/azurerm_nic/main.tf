resource "azurerm_network_interface" "nic"  {
    for_each = var.nic

  name                = each.value.nic_name
  location            = each.value.nic_location
  resource_group_name = each.value.nic_rg

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.nic1[each.key].id
    public_ip_address_id = data.azurerm_public_ip.public_ip[each.key].id
    private_ip_address_allocation = "Dynamic"
   
  }
}

data "azurerm_subnet" "nic1" {   
    for_each = var.nic
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.nic_rg
}

data "azurerm_public_ip" "public_ip" { 
    for_each = var.nic
  name                = each.value.pip_name
  resource_group_name =  each.value.nic_rg
}