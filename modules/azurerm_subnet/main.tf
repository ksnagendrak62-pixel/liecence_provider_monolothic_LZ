resource "azurerm_subnet" "subnet" {
for_each = var.subnet
name = each.value.sub_name
resource_group_name = each.value.sb_rg
virtual_network_name = each.value.sub_vnet
address_prefixes = each.value.address_prefixes
  
}