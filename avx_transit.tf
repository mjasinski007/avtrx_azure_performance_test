
module "azure_ause_transit" {
    source  = "terraform-aviatrix-modules/mc-transit/aviatrix"
    version = "2.4.1"

    cloud                         = "azure"
    region                        = var.az_ause_region
    account                       = var.azure_ctrl_account_name
    name                          = var.az_ause_transit_vnet_name
    gw_name                       = var.az_ause_transit_gw_name
    instance_size                 = var.az_ause_transit_gw_instance_size
    cidr                          = var.az_ause_transit_vpc_cidr
    ha_gw                         = true
    az_support                    = true
    connected_transit             = true
    enable_egress_transit_firenet = false
    enable_multi_tier_transit     = false
    enable_transit_firenet        = true

    tags = merge(
        local.default_tags,
        {
            DESCRIPTION = "Aviatrix Transit VPC and Gateway in Australia East"
        }
    )
}


module "firenet_checkpoint_fw" {
    source  = "terraform-aviatrix-modules/mc-firenet/aviatrix"
    version = "v1.4.3"

    transit_module  = module.azure_ause_transit
    firewall_image  = "Check Point CloudGuard IaaS Single Gateway R81.10 - Pay As You Go (NGTP)"
    custom_fw_names = ["avx-az-ause-az1-fw1", "avx-az-ause-az2-fw1"]
    instance_size   = "Standard_D3_v2"
    username        = "admin"
    password        = "Its@secret!23"
    sic_key         = "1234"
    egress_enabled  = false
}