variable "project" {
    description = "Project Name"
    type        = string 
}

variable "env" {
    description = "Environment Name(dev,qa,prod)"
    type        = string
}

variable "region" {
    description = "AWS Region Name"
    type        = string
    default     = "us-east-1"
}

variable "vpc_cidr" {
    description = "VPC CIDR Block"
    type        = string
    default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    description = "Public Subnet CIDR Block"
    type        = list(string)
}

variable "private_subnet_cidr" {
    description = "Private Subnet CIDR Block"
    type        = list(string)
}

variable database_subnet_cidr {
    description = "Database Subnet CIDR Block"
    type        = list(string)
}