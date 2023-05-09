terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket = "thecloudworld-terraform"
    key    = "tfstate/terraform.tfstate"
    region = "us-east-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  #assume_role {
  #  role_arn     = var.assume_role
  #  external_id  = "12345"
  #}
}

variable "assume_role" {}

# VPC Child Module
# Autoscaling Group Module
# RDS Module

module "vpc" {
    source = "https://github.com/TheCloudWorldAdmin/terraform-aws-vpc-module.git"
}

module "asg" {
    source = "https://github.com/TheCloudWorldAdmin/terraform-aws-autoscaling-group.git"
}

module "rds" {
    source = "https://github.com/TheCloudWorldAdmin/terraform-aws-rds-module.git"
}