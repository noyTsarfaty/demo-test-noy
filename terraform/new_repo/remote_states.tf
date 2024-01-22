
###############################################################################
#   Remote to application_layer
###############################################################################
//data "terraform_remote_state" "api_ga_data" {
//  count = (var.use_remote_state == "update") ? 1 : 0
//  backend   = "s3"
//  config    = {
//    region  = var.master_region
//    bucket  = "${var.environment}-state-files-terraform"
//    key     = "${var.branch}/application_layer/saas_bmc_state.tfstate"
//  }
//}