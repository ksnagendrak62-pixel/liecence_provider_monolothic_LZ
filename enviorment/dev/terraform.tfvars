rgs = {
  rg1 = {
    rg_name  = "babalok"
    location = "west us"
  }
  rg2 = {
     rg_name  = "patallok"
    location = "west us"
  }
  rg3 = {
     rg_name  = "hen"
    location = "west us"
}
}


vnet = {
  vnet1 = {
    vnet_name     = "sasaram"
    location      = "west us"
    vnet_rg       = "babalok"
    address_space = ["10.0.0.0/16"]
  }
}

subnet = {
  sub1 = {
    sub_name         = "frontend_vm"
    sb_rg            = "babalok"
    sub_vnet         = "sasaram"
    address_prefixes = ["10.0.0.0/24"]
  }
  sub2 = {
    sub_name         = "AzureBastionSubnet"
    sb_rg            = "babalok"
    sub_vnet         = "sasaram"
    address_prefixes = ["10.0.1.0/24"]

  }

  sub3 = {
    sub_name         = "backednd_vm"
    sb_rg            = "babalok"
    sub_vnet         = "sasaram"
    address_prefixes = ["10.0.2.0/24"]
  }
}

pip = {

  pip1 = {
    pip_name          = "frontvm"
    pip_rg            = "babalok"
    location          = "west us"
    allocation_method = "Static"
  }
}

nic = {

  nic1 = {
    nic_name     = "nic_vm"
    nic_location = "west us"
    nic_rg       = "babalok"
    subnet_name  = "frontend_vm"
    vnet_name    = "sasaram"
    pip_name     = "frontvm"

  }
}

vms = {
  vm1 = { 
  vm_name  = "linuxvmfront"
  vm_rg    = "babalok"
  location = "west us"
  nic_name = "nic_vm"

}
}