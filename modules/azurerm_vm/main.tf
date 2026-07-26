resource "azurerm_linux_virtual_machine" "vms" {
    for_each = var.vms
  name                = each.value.vm_name
  resource_group_name = each.value.vm_rg
  location            = each.value.location
  size                = "Standard_B2s"
  admin_username      = "adminuser"
admin_password = "July12345"
disable_password_authentication = false

  network_interface_ids = [
  data.azurerm_network_interface.vms[each.key].id
  ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}