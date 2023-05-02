


/* 

output "A_UbntFrontHost1_IPAddress" {
    value = "ssh ubuntu@${azurerm_public_ip.az_ause_front_ubnt_host1_public_ip.ip_address}"
}

output "B_UbntBackHost2_IPAddress" {
    value = "ssh ubuntu@${azurerm_public_ip.az_ause_back_ubnt_host1_public_ip.ip_address}"
}


output "C_WinSrvFrontHost1_IPAddress" {
    value = azurerm_public_ip.az_ause_front_winsrv_host1_public_ip.ip_address
}

output "D_WinSrvBackHost2_IPAddress" {
    value = azurerm_public_ip.az_ause_back_winsrv_host1_public_ip.ip_address
} */

/* output "A_UbntFrontHost1_IPAddress" {
    value = "ssh ubuntu@${azurerm_linux_virtual_machine.az_ause_front_host1_vm.public_ip_address}"
}

output "B_UbntBackHost2_IPAddress" {
    value = "ssh ubuntu@${azurerm_linux_virtual_machine.az_ause_back_host1_vm.public_ip_address}"
}


output "C_WinSrvFrontHost1_IPAddress" {
    value = azurerm_windows_virtual_machine.az_ause_front_winsrv_host1_vm.public_ip_address
}

output "D_WinSrvBackHost2_IPAddress" {
    value = azurerm_windows_virtual_machine.az_ause_back_winsrv_host1_vm.public_ip_address
} */

/* 
output "Spoke_id" {
    value = module.azure_ause_spoke_frontend.vpc.vpc_id

} */

#azure_vnet_resource_id

/* output "Frontend_Subnets" {
    value = module.azure_ause_spoke_frontend.vpc.subnets
}


output "Backend_Subnets" {
    value = module.azure_ause_spoke_backend.vpc.subnets
} */