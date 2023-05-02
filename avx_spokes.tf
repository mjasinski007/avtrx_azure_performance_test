####################################################
### Create Spoke 1 (Frontend) in Australia East  ###
####################################################

module "azure_ause_spoke_frontend" {
    source  = "terraform-aviatrix-modules/mc-spoke/aviatrix"
    version = "1.5.0"

    cloud              = "Azure"
    account            = var.azure_ctrl_account_name
    name               = var.az_ause_spoke_front_gw_name
    region             = var.az_ause_spoke_front_region
    cidr               = var.az_ause_spoke_front_vpc_cidr
    instance_size      = var.az_ause_spoke_front_gw_instance_size
    ha_gw              = true
    az_support         = true
    subnet_pairs       = 4
    subnet_size        = 28
    transit_gw         = var.az_ause_transit_gw_name
    attached           = true
    attached_gw_egress = false
    #security_domain   = "green"

    tags = merge(
        local.default_tags,
        {
            DESCRIPTION = "Aviatrix Frontend Spoke VPC and Gateway in Australia East"
        }
    )
    depends_on = [module.azure_ause_transit]
}

####################################################
### Create Spoke 2 (Backend) in Australia East  ###
####################################################


module "azure_ause_spoke_backend" {
    source  = "terraform-aviatrix-modules/mc-spoke/aviatrix"
    version = "1.5.0"

    cloud              = "Azure"
    account            = var.azure_ctrl_account_name
    name               = var.az_ause_spoke_back_gw_name
    region             = var.az_ause_spoke_back_region
    cidr               = var.az_ause_spoke_back_vpc_cidr
    instance_size      = var.az_ause_spoke_back_gw_instance_size
    ha_gw              = true
    az_support         = true
    subnet_pairs       = 4
    subnet_size        = 28
    transit_gw         = var.az_ause_transit_gw_name
    attached           = true
    attached_gw_egress = false
    #security_domain   = "green"

    tags = merge(
        local.default_tags,
        {
            DESCRIPTION = "Aviatrix Backend Spoke VPC and Gateway in Australia East"
        }
    )
    depends_on = [module.azure_ause_transit]
}