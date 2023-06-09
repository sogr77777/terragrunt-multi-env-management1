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
  environment       = "Staging"
  eks_cluster_name  = "Staging-EKS-Demo"
  node_group_name   = "webapp-staging-01"
  node_role_name    = "NodeRole-staging"
  nodegroup_keypair = "webapp-staging-01-key"
  cluster_role      = "AWSEKSClsterRole-staging"
  region_name       = local.region
  vpc_cidr_block    = "10.20.0.0/24"
  # public_subnets  = ["10.20.0.0/24", "10.20.2.0/24"]
  # private_subnets = ["10.20.1.0/24", "10.20.3.0/24"]
  public_subnets = {
    "${local.region}a" = "10.20.0.0/24"
    "${local.region}b" = "10.20.2.0/24"
  }
  private_subnets = {
    "${local.region}a" = "10.20.1.0/24"
    "${local.region}b" = "10.20.3.0/24"
  }
}