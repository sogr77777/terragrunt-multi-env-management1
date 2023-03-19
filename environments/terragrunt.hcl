generate "backend" {
  path      = "s3-backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
  backend "s3" {
    bucket   = "awsdevops-sxl"
    key      = "${path_relative_to_include()}/terraform.tfstate"
    region   = "us-east-1"
    encrypt = true

    # skip_region_validation      = true
    # skip_credentials_validation = true
    # skip_metadata_api_check     = true
  }
}
EOF

}