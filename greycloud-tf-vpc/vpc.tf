module "vpc-network" {
  source = "git@bitbucket.org:gorcode/terraform-module.git//vpc-network"

  # Input variables
  project                         = var.project
  environment                     = var.environment
  region                          = var.region
  create_subnet                   = var.create_subnet
  subnet_ip_cidr_range            = var.subnet_ip_cidr_range
  enable_private_ip_google_access = var.enable_private_ip_google_access
  service_account_name            = var.service_account_name

  # Secondary ranges
  create_secondary_ranges = var.create_secondary_ranges
  pod_range_cidr          = var.pod_range_cidr
  svc_range_cidr          = var.svc_range_cidr
  
# Output variables
  #vpc_name         = module.vpc_subnet.vpc_name
  #vpc_self_link    = module.vpc_subnet.vpc_self_link
  #subnet_name      = module.vpc_subnet.subnet_name
  #subnet_self_link = module.vpc_subnet.subnet_self_link
}
