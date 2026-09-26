terraform {
    required_version = ">= 1.11.0"

    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 6.0"
        }
    }

}

provider "aws" {
    region = "us-east-1"

    default_tags {
        tags = {
            Project     = "pharma"
            Environment = "dev"
            ManagedBy    = "Terraform"
        }
    }
}

#default_tags — Every resource Terraform creates will automatically get these tags. 
#This makes it easy to find and filter resources in the AWS Console and calculate costs per project/environment.