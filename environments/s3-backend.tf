# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "s3" {
    bucket   = "awsdevops-sxl"
    key      = "./terraform.tfstate"
    region   = "us-east-1"
    encrypt = true

    # skip_region_validation      = true
    # skip_credentials_validation = true
    # skip_metadata_api_check     = true
  }
}
