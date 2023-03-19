# terraform {
#   source = "git::git@github.com:sudheerduba/aws-vpc-network-terraform.git//modules/vpc?ref=v1.1.0"
# }
# include "root"{
#   path = find_in_parent_folders()
# }
# inputs ={
#   region_name = "us-west-1"
#   public_az = ["us-west-1a", "us-west-1b"]
#   private_az = ["us-west-1a", "us-west-1b"]
# }
terraform {
  source = "git::git@github.com:sudheerduba/aws-vpc-network-terraform.git//modules?ref=v1.3.0"
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


  # cluster_enabled_log_types       = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
  # public_subnets  = ["10.10.0.0/24", "10.10.2.0/24"]
  # private_subnets = ["10.10.1.0/24", "10.10.3.0/24"]
  # public_subnets = [
  #   "10.10.0.0/24",
  #   "10.10.2.0/24"
  # ]
  # private_subnets = [
  #   "10.10.1.0/24",
  #   "10.10.3.0/24"
  # ]
  public_subnets = {
    "${local.region}a" = "10.10.0.0/24"
    "${local.region}b" = "10.10.2.0/24"
  }
  private_subnets = {
    "${local.region}a" = "10.10.1.0/24"
    "${local.region}b" = "10.10.3.0/24"
  }
}