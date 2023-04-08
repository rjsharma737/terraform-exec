module "vpn" {
  source = "git@bitbucket.org:gorcode/terraform-module.git//vpn-network"

  network_name         = var.network_name
  region               = var.region
  project              = var.project
  peer_ip1             = var.peer_ip1
  peer_ip2             = var.peer_ip2
  peer_asn             = var.peer_asn
  shared_secret        = var.shared_secret
  cloud_router_bgp_ipv4 = var.cloud_router_bgp_ipv4
  peer_router_bgp_ipv4  = var.peer_router_bgp_ipv4
}
