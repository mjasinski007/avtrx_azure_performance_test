##########################
### Azure Subscription ###
##########################

azure_subscription_id = "46604b85-cf80-46e4-9117-10f9000797f9"
azure_client_id       = "b76ef98d-276e-4627-9c22-7136073d4d51"
azure_client_secret   = "A6f7Q~XRy4q4GBnOYaDZiBQDJtg5KmlLyZyun"
azure_tenant_id       = "4780055e-ce37-4f02-b33d-fdad8493a4b6"

az_ause_region                   = "Australia East"


###########################
### Aviatrix Controller ###
###########################

azure_ctrl_account_name = "avtx_azure_account"
ctrl_username           = "admin"
ctrl_password           = "Its@secret!23"
ctrl_ip                 = "3.10.92.20"

########################
### Aviatrix Transit ###
########################


az_ause_transit_gw_name          = "avx-az-ause-transit-gw"
#az_ause_transit_gw_instance_size = "Standard_D2_v4"
az_ause_transit_gw_instance_size = "Standard_D8s_v4"
az_ause_transit_vpc_cidr         = "10.150.0.0/16"
az_ause_transit_vnet_name        = "avx-az-ause-transit-vnet"


###############################
### Aviatrix Frontend Spoke ###
###############################


az_ause_spoke_front_region           = "Australia East"
az_ause_spoke_front_vnet_name        = "avx-az-ause-spoke-front-vnet"
az_ause_spoke_front_gw_name          = "avx-az-ause-spoke-front-gw"
az_ause_spoke_front_gw_instance_size = "Standard_D8s_v4"
az_ause_spoke_front_vpc_cidr         = "10.10.0.0/16"


##############################
### Aviatrix Backend Spoke ###
##############################

az_ause_spoke_back_region           = "Australia East"
az_ause_spoke_back_vnet_name        = "avx-az-ause-spoke-back-vnet"
az_ause_spoke_back_gw_name          = "avx-az-ause-spoke-back-gw"
az_ause_spoke_back_gw_instance_size = "Standard_D8s_v4"
az_ause_spoke_back_vpc_cidr         = "10.20.0.0/16"


###--------------------- FRONTEND ---------------------###

##############################
### Frontend Ubuntu Host 1 ###
##############################

az_ause_front_ubnt_host1_password       = "Its@secret!23"
az_ause_front_ubnt_host1_name           = "az-front-vm1-ubnt"
#az_ause_front_ubnt_host1_instance_size  = "Standard_D2_v4"
az_ause_front_ubnt_host1_instance_size  = "Standard_D8s_v4"
az_ause_front_ubnt_host1_static_priv_ip = "10.10.0.20"


##############################
### Frontend Ubuntu Host 2 ###
##############################

az_ause_front_ubnt_host2_password       = "Its@secret!23"
az_ause_front_ubnt_host2_name           = "az-front-vm2-ubnt"
#az_ause_front_ubnt_host2_instance_size  = "Standard_D2_v4"
az_ause_front_ubnt_host2_instance_size  = "Standard_D8s_v4"
az_ause_front_ubnt_host2_static_priv_ip = "10.10.0.115"

###############################
### Frontend Windows Host 1 ###
###############################

az_ause_front_winsrv_host1_name            = "az-fvm1-win"
az_ause_front_winsrv_host1_username        = "tfadmin"
az_ause_front_winsrv_host1_password        = "Its@secret!23"
az_ause_front_winsrv_host1_instance_size   = "Standard_D8s_v4"
az_ause_front_winsrv_host1_sku             = "2019-Datacenter"
az_ause_front_winsrv_host1_static_priv_ip  = "10.10.0.60"


###--------------------- BACKEND ---------------------###


#############################
### Backend Ubuntu Host 1 ###
#############################

az_ause_back_ubnt_host1_password       = "Its@secret!23"
az_ause_back_ubnt_host1_name           = "az-back-vm1-ubnt"
az_ause_back_ubnt_host1_instance_size  = "Standard_D8s_v4"
az_ause_back_ubnt_host1_static_priv_ip = "10.20.0.21"

###############################
### Backend Windows Host 1 ####
###############################

az_ause_back_winsrv_host1_name           = "az-bvm1-win"
az_ause_back_winsrv_host1_username       = "tfadmin"
az_ause_back_winsrv_host1_password       = "Its@secret!23"
az_ause_back_winsrv_host1_instance_size  = "Standard_D8s_v4"
az_ause_back_winsrv_host1_sku            = "2019-Datacenter"
az_ause_back_winsrv_host1_static_priv_ip = "10.20.0.61"


#############
### Tags ####
#############

createdby    = "TERRAFORM"
environment  = "Australia East"
maintainedby = "AVIATRIX"
owner        = "vMario"
repo         = "https://github.com/mjasinski007/avtrx_azure_performance_test.git"