terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.57.0"
    }
  }
}

provider "aws" {
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "default"
}

terraform {
  backend "s3" {
    bucket = "terraform-state-amith-jayawardane"
    key    = "aws-eks-alb-basic"
    region = "ap-southeast-1"
  }
}
