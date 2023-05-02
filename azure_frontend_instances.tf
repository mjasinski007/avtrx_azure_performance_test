################################################
### Linux Frontend Host 1 in Australia East  ###
################################################


data "template_file" "az_ause_front_ubnt_host1_bootstrap" {
    template = file("${path.module}/scripts/ubuntu_bootstrap.sh")
    vars = {
        name     = "Frondend_UbntHost1"
        password = var.az_ause_front_ubnt_host1_password
    }
}


resource "azurerm_public_ip" "az_ause_front_ubnt_host1_public_ip" {
    name                = "Frondend-UbntHost1-Pip"
    resource_group_name = module.azure_ause_spoke_frontend.vpc.resource_group
    location            = module.azure_ause_spoke_frontend.vpc.region
    allocation_method   = "Static"
    zones               = ["2"]
    sku                 = "Standard"
}


resource "azurerm_network_interface" "az_ause_front_ubnt_host1_main_nic" {
    name                          = "${var.az_ause_front_ubnt_host1_name}-nic1"
    resource_group_name           = module.azure_ause_spoke_frontend.vpc.resource_group
    location                      = module.azure_ause_spoke_frontend.vpc.region
    enable_accelerated_networking = true
    ip_configuration {
        name                          = module.azure_ause_spoke_frontend.vpc.public_subnets[1].name
        subnet_id                     = module.azure_ause_spoke_frontend.vpc.public_subnets[1].subnet_id
        private_ip_address_allocation = "Static"
        public_ip_address_id          = azurerm_public_ip.az_ause_front_ubnt_host1_public_ip.id
        private_ip_address            = var.az_ause_front_ubnt_host1_static_priv_ip
    }
}

resource "azurerm_network_security_group" "az_ause_front_ubnt_host1_nsg" {
    name                = "${var.az_ause_front_ubnt_host1_name}-nsg"
    resource_group_name = module.azure_ause_spoke_frontend.vpc.resource_group
    location            = module.azure_ause_spoke_frontend.vpc.region
}


##### PERMIT ALL #####
resource "azurerm_network_security_rule" "az_ause_front_ubnt_host1_tcp_all_rule" {
    access                      = "Allow"
    direction                   = "Inbound"
    name                        = "TCP_ALL"
    priority                    = 100
    protocol                    = "Tcp"
    source_port_range           = "*"
    source_address_prefix       = "*"
    destination_port_range      = "*"
    destination_address_prefix  = "*"
    resource_group_name         = module.azure_ause_spoke_frontend.vpc.resource_group
    network_security_group_name = azurerm_network_security_group.az_ause_front_ubnt_host1_nsg.name
}

resource "azurerm_network_security_rule" "az_ause_front_ubnt_host1_icmp_all_rule" {
    access                      = "Allow"
    direction                   = "Inbound"
    name                        = "ICMP_ALL"
    priority                    = 110
    protocol                    = "Icmp"
    source_port_range           = "*"
    source_address_prefix       = "*"
    destination_port_range      = "*"
    destination_address_prefix  = "*"
    resource_group_name         = module.azure_ause_spoke_frontend.vpc.resource_group
    network_security_group_name = azurerm_network_security_group.az_ause_front_ubnt_host1_nsg.name
}

resource "azurerm_network_security_rule" "az_ause_front_ubnt_host1_udp_all_rule" {
    access                      = "Allow"
    direction                   = "Inbound"
    name                        = "UDP_ALL"
    priority                    = 120
    protocol                    = "Udp"
    source_port_range           = "*"
    source_address_prefix       = "*"
    destination_port_range      = "*"
    destination_address_prefix  = "*"
    resource_group_name         = module.azure_ause_spoke_frontend.vpc.resource_group
    network_security_group_name = azurerm_network_security_group.az_ause_front_ubnt_host1_nsg.name
}



/* resource "azurerm_network_security_rule" "az_ause_front_ubnt_host1_http_rule" {
    access                      = "Allow"
    direction                   = "Inbound"
    name                        = "http"
    priority                    = 100
    protocol                    = "Tcp"
    source_port_range           = "*"
    source_address_prefix       = "*"
    destination_port_range      = "80"
    destination_address_prefix  = "*"
    resource_group_name         = module.azure_ause_spoke_frontend.vpc.resource_group
    network_security_group_name = azurerm_network_security_group.az_ause_front_ubnt_host1_nsg.name
}

resource "azurerm_network_security_rule" "az_ause_front_ubnt_host1_http_rule_ssh_rule" {
    access                      = "Allow"
    direction                   = "Inbound"
    name                        = "ssh"
    priority                    = 110
    protocol                    = "Tcp"
    source_port_range           = "*"
    source_address_prefix       = "*"
    destination_port_range      = "22"
    destination_address_prefix  = "*"
    resource_group_name         = module.azure_ause_spoke_frontend.vpc.resource_group
    network_security_group_name = azurerm_network_security_group.az_ause_front_ubnt_host1_nsg.name
}

resource "azurerm_network_security_rule" "az_ause_front_ubnt_host1_http_rule_icmp_rule" {
    access                      = "Allow"
    direction                   = "Inbound"
    name                        = "icmp"
    priority                    = 120
    protocol                    = "Icmp"
    source_port_range           = "*"
    source_address_prefix       = "*"
    destination_port_range      = "*"
    destination_address_prefix  = "*"
    resource_group_name         = module.azure_ause_spoke_frontend.vpc.resource_group
    network_security_group_name = azurerm_network_security_group.az_ause_front_ubnt_host1_nsg.name
} */

resource "azurerm_network_interface_security_group_association" "az_ause_front_ubnt_host1_nic_assoc" {
    network_interface_id      = azurerm_network_interface.az_ause_front_ubnt_host1_main_nic.id
    network_security_group_id = azurerm_network_security_group.az_ause_front_ubnt_host1_nsg.id

    depends_on = [azurerm_network_interface.az_ause_front_ubnt_host1_main_nic]
}

resource "azurerm_linux_virtual_machine" "az_ause_front_ubnt_host1_vm" {
    name                            = var.az_ause_front_ubnt_host1_name
    resource_group_name             = module.azure_ause_spoke_frontend.vpc.resource_group
    location                        = module.azure_ause_spoke_frontend.vpc.region
    size                            = var.az_ause_front_ubnt_host1_instance_size
    admin_username                  = "ubuntu"
    admin_password                  = var.az_ause_front_ubnt_host1_password
    disable_password_authentication = false
    zone                            = 2
    network_interface_ids = [
        azurerm_network_interface.az_ause_front_ubnt_host1_main_nic.id,
    ]

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    os_disk {
        storage_account_type = "Standard_LRS"
        caching              = "ReadWrite"
    }

    custom_data = base64encode(data.template_file.az_ause_front_ubnt_host1_bootstrap.rendered)

    depends_on = [azurerm_network_interface.az_ause_front_ubnt_host1_main_nic]
}

### --------------------------------------------------------------------------------------- ###

#################################################
### Linux Frontend Host 2 in Australia East  ###
################################################



/* data "template_file" "azure_ause_front_host2_bootstrap" {
    template = file("${path.module}/scripts/ubuntu_bootstrap.sh")
    vars = {
        name     = "Frondend_UbntHost2"
        password = var.az_ause_spoke_front_ubnt_host2_password
    }
}

resource "azurerm_public_ip" "az_ause_front_ubnt_host2_public_ip" {
    name                = "Frondend-UbntHost2-Pip"
    resource_group_name = module.azure_ause_spoke_frontend.vpc.resource_group
    location            = module.azure_ause_spoke_frontend.vpc.region
    allocation_method   = "Static"
    zones               = ["3"]
    sku                 = "Standard"
}

resource "azurerm_network_interface" "az_ause_front_ubnt_host2_main_nic" {
    name                          = "${var.az_ause_front_ubnt_host2_name}-nic1"
    resource_group_name           = module.azure_ause_spoke_frontend.vpc.resource_group
    location                      = module.azure_ause_spoke_frontend.vpc.region
    enable_accelerated_networking = true
    ip_configuration {
        name                          = module.azure_ause_spoke_frontend.vpc.public_subnets[3].name
        subnet_id                     = module.azure_ause_spoke_frontend.vpc.public_subnets[3].subnet_id
        private_ip_address_allocation = "Static"
        public_ip_address_id          = azurerm_public_ip.az_ause_front_ubnt_host2_public_ip.id
        private_ip_address            = var.az_ause_front_ubnt_host2_static_priv_ip
    }
}

resource "azurerm_network_security_group" "az_ause_front_ubnt_host2_nsg" {
    name                = "${var.az_ause_spoke_front_ubnt_host2_name}-nsg"
    resource_group_name = module.azure_ause_spoke_frontend.vpc.resource_group
    location            = module.azure_ause_spoke_frontend.vpc.region
}

resource "azurerm_network_security_rule" "az_ause_front_ubnt_host2_http_rule" {
    access                      = "Allow"
    direction                   = "Inbound"
    name                        = "http"
    priority                    = 100
    protocol                    = "Tcp"
    source_port_range           = "*"
    source_address_prefix       = "*"
    destination_port_range      = "80"
    destination_address_prefix  = "*"
    resource_group_name         = module.azure_ause_spoke_frontend.vpc.resource_group
    network_security_group_name = azurerm_network_security_group.az_ause_front_ubnt_host2_nsg.name
}

resource "azurerm_network_security_rule" "az_ause_front_ubnt_host2_http_rule_ssh_rule" {
    access                      = "Allow"
    direction                   = "Inbound"
    name                        = "ssh"
    priority                    = 110
    protocol                    = "Tcp"
    source_port_range           = "*"
    source_address_prefix       = "*"
    destination_port_range      = "22"
    destination_address_prefix  = "*"
    resource_group_name         = module.azure_ause_spoke_frontend.vpc.resource_group
    network_security_group_name = azurerm_network_security_group.az_ause_front_ubnt_host2_nsg.name
}

resource "azurerm_network_security_rule" "az_ause_front_ubnt_host2_http_rule_icmp_rule" {
    access                      = "Allow"
    direction                   = "Inbound"
    name                        = "icmp"
    priority                    = 120
    protocol                    = "Icmp"
    source_port_range           = "*"
    source_address_prefix       = "*"
    destination_port_range      = "*"
    destination_address_prefix  = "*"
    resource_group_name         = module.azure_ause_spoke_frontend.vpc.resource_group
    network_security_group_name = azurerm_network_security_group.az_ause_front_ubnt_host2_nsg.name
}

resource "azurerm_network_interface_security_group_association" "az_ause_front_host2_nic_assoc" {
    network_interface_id      = azurerm_network_interface.az_ause_front_ubnt_host2_main_nic.id
    network_security_group_id = azurerm_network_security_group.az_ause_front_ubnt_host2_nsg.id
}

resource "azurerm_linux_virtual_machine" "az_ause_front_host2_vm" {
    name                            = var.az_ause_spoke_front_ubnt_host2_name
    resource_group_name             = module.azure_ause_spoke_frontend.vpc.resource_group
    location                        = module.azure_ause_spoke_frontend.vpc.region
    size                            = var.az_ause_front_ubnt_host2_instance_size
    admin_username                  = "ubuntu"
    admin_password                  = var.az_ause_spoke_front_ubnt_host2_password
    disable_password_authentication = false
    zone                            = 3
    network_interface_ids = [
        azurerm_network_interface.az_ause_front_ubnt_host2_main_nic.id,
    ]

    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    os_disk {
        storage_account_type = "Standard_LRS"
        caching              = "ReadWrite"
    }

    custom_data = base64encode(data.template_file.azure_ause_front_host2_bootstrap.rendered)
} */


### --------------------------------------------------------------------------------------- ###

##################################################
### Windows Frontend Host 1 in Australia East  ###
##################################################

resource "azurerm_public_ip" "az_ause_front_winsrv_host1_public_ip" {
    name                = "Frondend-WindowsServerHost1-Pip"
    resource_group_name = module.azure_ause_spoke_frontend.vpc.resource_group
    location            = module.azure_ause_spoke_frontend.vpc.region
    allocation_method   = "Static"
    zones               = ["1"]
    sku                 = "Standard"
}

resource "azurerm_network_interface" "az_ause_front_winsrv_host1_main_nic" {
    name                          = "${var.az_ause_front_winsrv_host1_name}-nic1"
    resource_group_name           = module.azure_ause_spoke_frontend.vpc.resource_group
    location                      = module.azure_ause_spoke_frontend.vpc.region
    enable_accelerated_networking = true
    ip_configuration {
        name                          = module.azure_ause_spoke_frontend.vpc.public_subnets[2].name
        subnet_id                     = module.azure_ause_spoke_frontend.vpc.public_subnets[2].subnet_id
        private_ip_address_allocation = "Static"
        public_ip_address_id          = azurerm_public_ip.az_ause_front_winsrv_host1_public_ip.id
        private_ip_address            = var.az_ause_front_winsrv_host1_static_priv_ip
    }
}

resource "azurerm_network_security_group" "az_ause_front_winsrv_host1_nsg" {
    name                = "${var.az_ause_front_winsrv_host1_name}-nsg"
    resource_group_name = module.azure_ause_spoke_frontend.vpc.resource_group
    location            = module.azure_ause_spoke_frontend.vpc.region
}

/* resource "azurerm_network_security_rule" "az_ause_front_winsrv_host1_rdp_rule" {
    access                      = "Allow"
    direction                   = "Inbound"
    name                        = "rdp"
    priority                    = 100
    protocol                    = "Tcp"
    source_port_range           = "*"
    source_address_prefix       = "*"
    destination_port_range      = "3389"
    destination_address_prefix  = "*"
    resource_group_name         = module.azure_ause_spoke_frontend.vpc.resource_group
    network_security_group_name = azurerm_network_security_group.az_ause_front_winsrv_host1_nsg.name
} */

#### PERMIT ALL ####

resource "azurerm_network_security_rule" "az_ause_front_winsrv_host1_tcp_all_rule" {
    access                      = "Allow"
    direction                   = "Inbound"
    name                        = "TCP_ALL"
    priority                    = 100
    protocol                    = "Tcp"
    source_port_range           = "*"
    source_address_prefix       = "*"
    destination_port_range      = "*"
    destination_address_prefix  = "*"
    resource_group_name         = module.azure_ause_spoke_frontend.vpc.resource_group
    network_security_group_name = azurerm_network_security_group.az_ause_front_winsrv_host1_nsg.name
}

resource "azurerm_network_security_rule" "az_ause_front_winsrv_host1_udp_all_rule" {
    access                      = "Allow"
    direction                   = "Inbound"
    name                        = "UDP_ALL"
    priority                    = 110
    protocol                    = "Udp"
    source_port_range           = "*"
    source_address_prefix       = "*"
    destination_port_range      = "*"
    destination_address_prefix  = "*"
    resource_group_name         = module.azure_ause_spoke_frontend.vpc.resource_group
    network_security_group_name = azurerm_network_security_group.az_ause_front_winsrv_host1_nsg.name
}

resource "azurerm_network_security_rule" "az_ause_front_winsrv_host1_icmp_all_rule" {
    access                      = "Allow"
    direction                   = "Inbound"
    name                        = "ICMP_ALL"
    priority                    = 120
    protocol                    = "Icmp"
    source_port_range           = "*"
    source_address_prefix       = "*"
    destination_port_range      = "*"
    destination_address_prefix  = "*"
    resource_group_name         = module.azure_ause_spoke_frontend.vpc.resource_group
    network_security_group_name = azurerm_network_security_group.az_ause_front_winsrv_host1_nsg.name
}

resource "azurerm_network_interface_security_group_association" "az_ause_front_winsrv_host1_nic_assoc" {
    network_interface_id      = azurerm_network_interface.az_ause_front_winsrv_host1_main_nic.id
    network_security_group_id = azurerm_network_security_group.az_ause_front_winsrv_host1_nsg.id

    depends_on = [azurerm_network_interface.az_ause_front_winsrv_host1_main_nic]
}

resource "azurerm_windows_virtual_machine" "az_ause_front_winsrv_host1_vm" {
    name                            = var.az_ause_front_winsrv_host1_name
    resource_group_name             = module.azure_ause_spoke_frontend.vpc.resource_group
    location                        = module.azure_ause_spoke_frontend.vpc.region
    size                            = var.az_ause_front_winsrv_host1_instance_size
    admin_username                  = var.az_ause_front_winsrv_host1_username
    admin_password                  = var.az_ause_front_winsrv_host1_password
    zone                            = 1
    network_interface_ids = [
        azurerm_network_interface.az_ause_front_winsrv_host1_main_nic.id,
    ]

    source_image_reference {
        publisher = "MicrosoftWindowsServer"
        offer     = "WindowsServer"
        sku       = var.az_ause_front_winsrv_host1_sku
        version   = "latest"
    }

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    depends_on = [azurerm_network_interface.az_ause_front_winsrv_host1_main_nic]
}

/* resource "azurerm_virtual_machine_extension" "az_ause_front_winsrv_host1_bootstrap" {
    depends_on           = [azurerm_windows_virtual_machine.az_ause_front_winsrv_host1_vm]
    name                 = "az-ause-front-winsrv-host1-install-software"
    virtual_machine_id   = azurerm_windows_virtual_machine.az_ause_front_winsrv_host1_vm.id
    publisher            = "Microsoft.Compute"
    type                 = "CustomScriptExtension"
    type_handler_version = "1.9"
    protected_settings   = <<SETTINGS
    {
        "commandToExecute": "powershell -encodedCommand ${textencodebase64(file("./scripts/windows_bootstrap.ps1"), "UTF-16LE")}"
    }
    SETTINGS
} */



