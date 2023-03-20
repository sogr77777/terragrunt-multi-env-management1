terraform {
  source = "git::git@github.com:sogr77777/aws-vpc-network-terraform-1.git//modules?ref=v1.3.0"
}
include "root" {
  path = find_in_parent_folders()
}

locals {
  region = "us-east-1"
}

inputs = {
  environment       = "Developement"
  eks_cluster_name  = "Dev-EKS-Demo"
  node_group_name   = "webapp-dev-01"
  node_role_name    = "NodeRole-dev"
  nodegroup_keypair = "webapp-dev-01-key"
  cluster_role      = "AWSEKSClsterRole-dev"
  region_name       = local.region
  vpc_cidr_block    = "10.10.0.0/24"

  public_subnets = {
    "${local.region}a" = "10.10.0.0/24"
    "${local.region}b" = "10.10.2.0/24"
  }
  private_subnets = {
    "${local.region}a" = "10.10.1.0/24"
    "${local.region}b" = "10.10.3.0/24"
  }
}