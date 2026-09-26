terraform {
    backend "s3" {
        bucket = "zen-pharma-backend-terraform-state-bucket"
        key    = "dev/terraform.tfstate"
        region = "us-east-1"
        use_lockfile = true
        encrypt = true
    }
}

#use_lockfile = true — This is a Terraform 1.11+ feature that uses S3 native locking. 
#It creates a .tflock file next to the state file. 
#This prevents two people (or CI jobs) from running terraform apply at the same time and corrupting the state.