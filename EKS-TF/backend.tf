terraform {
  backend "s3" {
    bucket       = "prashant-tfstates-bucket"
    region       = "ap-south-1"
    key          = "devsecops-eks-tetris/terraform.tfstate"
    use_lockfile = true
    encrypt      = true
  }
  required_version = ">=1.14.0"
  required_providers {
    aws = {
      version = ">= 5.49.0"
      source  = "hashicorp/aws"
    }
  }
}