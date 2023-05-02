variable "azure_subscription_id" {
    type = string
}

variable "azure_client_id" {
    type = string
}

variable "azure_client_secret" {
    type = string
}

variable "azure_tenant_id" {
    type = string
}

variable "azure_ctrl_account_name" {
    type = string
}

variable "ctrl_username" {
    type = string
}

variable "ctrl_password" {
    type = string
}

variable "ctrl_ip" {
    type = string
}

#################################
### Transit (Australia East) ###
################################

variable "az_ause_region" {
	type = string
}

variable "az_ause_transit_gw_name" {
    type = string
}

variable "az_ause_transit_gw_instance_size" {
    type = string
}

variable "az_ause_transit_vpc_cidr" {
    type = string
}

variable "az_ause_transit_vnet_name" {
    type = string
}



#######################################
### Frontend Spoke (Australia East) ###
#######################################

variable "az_ause_spoke_front_region" {
    type = string

}

variable "az_ause_spoke_front_vnet_name" {
    type = string
}

variable "az_ause_spoke_front_gw_name" {
    type = string
}

variable "az_ause_spoke_front_gw_instance_size" {
    type = string
}

variable "az_ause_spoke_front_vpc_cidr" {
    type = string
}



#######################################
### Backend Spoke (Australia East) ###
#######################################

variable "az_ause_spoke_back_region" {
    type = string
}

variable "az_ause_spoke_back_vnet_name" {
    type = string
}

variable "az_ause_spoke_back_gw_name" {
    type = string
}

variable "az_ause_spoke_back_gw_instance_size" {
    type = string
}

variable "az_ause_spoke_back_vpc_cidr" {
    type = string
}


##############################################
### Frontend Linux Host 1 (Australia East) ###
##############################################


variable "az_ause_front_ubnt_host1_password" {
    type = string
}

variable "az_ause_front_ubnt_host1_name" {
    type = string
}

variable "az_ause_front_ubnt_host1_instance_size" {
    type = string
}

variable "az_ause_front_ubnt_host1_static_priv_ip" {
    type = string
}

##############################################
### Frontend Linux Host 2 (Australia East) ###
##############################################


variable "az_ause_front_ubnt_host2_password" {
    type = string
}

variable "az_ause_front_ubnt_host2_name" {
    type = string
}

variable "az_ause_front_ubnt_host2_instance_size" {
    type = string
}

variable "az_ause_front_ubnt_host2_static_priv_ip" {
    type = string
}


#################################################
### Frontend Windows Host 1 (Australia East) ####
#################################################

variable "az_ause_front_winsrv_host1_name" {
    type = string
}

variable "az_ause_front_winsrv_host1_username" {
    type = string
}

variable "az_ause_front_winsrv_host1_password" {
    type = string
}

variable "az_ause_front_winsrv_host1_instance_size" {
    type = string
}

variable "az_ause_front_winsrv_host1_sku" {
    type = string
}

variable "az_ause_front_winsrv_host1_static_priv_ip" {
    type = string
}


##############################################
### Backend Linux Host 1 (Australia East)  ###
##############################################


variable "az_ause_back_ubnt_host1_password" {
    type = string
}

variable "az_ause_back_ubnt_host1_name" {
    type = string
}

variable "az_ause_back_ubnt_host1_instance_size" {
    type = string
}

variable "az_ause_back_ubnt_host1_static_priv_ip" {
    type = string
}


#################################################
### Backend Windows Host 1 (Australia East) ####
#################################################

variable "az_ause_back_winsrv_host1_name" {
    type = string
}

variable "az_ause_back_winsrv_host1_username" {
    type = string
}

variable "az_ause_back_winsrv_host1_password" {
    type = string
}

variable "az_ause_back_winsrv_host1_instance_size" {
    type = string
}

variable "az_ause_back_winsrv_host1_sku" {
    type = string
}

variable "az_ause_back_winsrv_host1_static_priv_ip" {
    type = string
}


############
### Tags ###
############

variable "createdby" {
    type = string
}

variable "environment" {
    type = string
}

variable "maintainedby" {
    type = string
}

variable "owner" {
    type = string
}

variable "repo" {
    type = string
}
