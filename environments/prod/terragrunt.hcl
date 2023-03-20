# terraform {
#   source = "git::git@github.com:sogr77777/aws-vpc-network-terraform-1.git//modules/vpc?ref=v1.1.0"
# }
# include "root"{
#   path = find_in_parent_folders()
# }
# inputs ={
#   region_name = "us-east-1"
#   public_az = ["us-east-1a", "us-east-1b"]
#   private_az = ["us-east-1a", "us-east-1b"]
#   environment = "Production"
# }

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
  environment       = "Production"
  eks_cluster_name  = "Prod-EKS-Demo"
  node_group_name   = "webapp-prod-01"
  node_role_name    = "NodeRole-prod"
  nodegroup_keypair = "webapp-prod-01-key"
  cluster_role      = "AWSEKSClsterRole-prod"
  region_name       = local.region
  vpc_cidr_block    = "10.30.0.0/24"
  # public_subnets  = ["10.30.0.0/24", "10.30.2.0/24"]
  # private_subnets = ["10.30.1.0/24", "10.30.3.0/24"]
  public_subnets = {
    "${local.region}a" = "10.30.0.0/24"
    "${local.region}b" = "10.30.2.0/24"
  }
  private_subnets = {
    "${local.region}a" = "10.30.1.0/24"
    "${local.region}b" = "10.30.3.0/24"
  }
}