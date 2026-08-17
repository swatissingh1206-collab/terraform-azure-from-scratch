rgs = {
  rg1 = {
    rg_name  = "rg123"
    location = "centralindia"
  }
}

vnets = {
  vnet1 = {
    rg_name       = "rg123"
    vnet_name     = "vnet123"
    location      = "centralindia"
    address_space = ["10.0.0.0/16"]
  }
}

snets = {
  snet1 = {
    rg_name          = "rg123"
    vnet_name        = "vnet123"
    snet_name        = "frontend_snet"
    location         = "centralindia"
    address_prefixes = ["10.0.1.0/24"]
  }
  snet2 = {
    rg_name          = "rg123"
    vnet_name        = "vnet123"
    snet_name        = "backend_snet"
    location         = "centralindia"
    address_prefixes = ["10.0.2.0/24"]
  }
  snet3 = {
    rg_name          = "rg123"
    vnet_name        = "vnet123"
    snet_name        = "AzureBastionSubnet"
    location         = "centralindia"
    address_prefixes = ["10.0.3.0/24"]
    subnet_key       = "snet3"
  }
}

vms = {
  vm1 = {
    vm_name                   = "frontendvm"
    rg_name                   = "rg123"
    vnet_name                 = "vnet123"
    subnet_key                = "snet1"
    location                  = "centralindia"
    vm_size                   = "Standard_D2s_v3"
    admin_username            = "adminuser"
    admin_password            = "Password@123"
    nic_name                  = "frontend_nic"
    nic_ip_name               = "nic-ip1"
    pvt_ip_address_allocation = "Dynamic"
    nic_subnet_name           = "frontend_snet"
  }
  vm2 = {
    vm_name                   = "backendvm"
    rg_name                   = "rg123"
    vnet_name                 = "vnet123"
    subnet_key                = "snet2"
    location                  = "centralindia"
    vm_size                   = "Standard_D2s_v3"
    admin_username            = "adminuser"
    admin_password            = "Password@456"
    nic_name                  = "backend_nic"
    nic_ip_name               = "nic-ip2"
    pvt_ip_address_allocation = "Dynamic"
    nic_subnet_name           = "backend_snet"
  }
}

bastions = {
  bastion1 = {
    bastion_name = "bastion-host"
    rg_name      = "rg123"
    location     = "centralindia"

    subnet_name = "AzureBastionSubnet"

    ip_config_name = "bastion-ipconfig"

    pip_name          = "bastion-pip"
    allocation_method = "Static"
    sku               = "Standard"
    subnet_key        = "snet3"

  }
}
