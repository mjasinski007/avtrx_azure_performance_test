###########################
### Frontend to Transit ###
###########################

###-! Uncomment if you want to use Native Peerimgs !-###


/* resource "aviatrix_azure_spoke_native_peering" "frontend_to_tranist_native_peering" {
    transit_gateway_name = module.azure_ause_transit.transit_gateway.gw_name
    spoke_account_name   = var.azure_ctrl_account_name
    spoke_region         = module.azure_ause_spoke_frontend.vpc.region
    spoke_vpc_id         = module.azure_ause_spoke_frontend.vpc.vpc_id

    depends_on = [module.azure_ause_transit, module.azure_ause_spoke_frontend]
}


###########################
### Backend to Transit ###
###########################

resource "aviatrix_azure_spoke_native_peering" "backend_to_tranist_native_peering" {
    transit_gateway_name = module.azure_ause_transit.transit_gateway.gw_name
    spoke_account_name   = var.azure_ctrl_account_name
    spoke_region         = module.azure_ause_spoke_backend.vpc.region
    spoke_vpc_id         = module.azure_ause_spoke_backend.vpc.vpc_id

    depends_on = [module.azure_ause_transit, module.azure_ause_spoke_backend]
} */


