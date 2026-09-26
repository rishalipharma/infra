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