data "azurerm_network_interface" "vms" { 
    for_each = var.vms
  name                = each.value.nic_name
  resource_group_name = each.value.vm_rg
}