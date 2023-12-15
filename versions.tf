terraform {
  required_version = "~> 1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.61.0"
    }
  }

  backend "s3" {
    bucket               = var.bucket # The S3 bucket where the Terraform state file will be stored
    key                  = "./terraform.tfstate" # The path to the state file within the bucket
    region               = var.region # The AWS region where the bucket is located
    encrypt              = true # If the state should be encrypted
    dynamodb_table       = var.dynamodb_table # DynamoDB table for state locking and consistency checking
    role_arn             = var.role_arn # IAM role ARN for Terraform to assume, if necessary
  }
}
