variable "project" {
    description = "Project Name"
    type        = string
}
variable "env" {
    description = "Environment Name(dev,qa,prod)"
    type        = string
}
variable "vpc_id" {
    description = "VPC ID of the EKS cluster"
    type        = string
}
variable "subnet_ids" {
    description = "List of subnet IDs for the EKS cluster"
    type        = list(string)
}
variable "instance_types" {
    description = "EC2 instance types for the EKS worker nodes"
    type        = list(string)
    default = ["t3.medium"]
}
variable "desired_size" {
    description = "Desired number of worker nodes"
    type        = number
    default     = 2
}
variable "min_size" {
    description = "Minimum number of worker nodes"
    type        = number
    default     = 1
}
variable "max_size" {
    description = "Maximum number of worker nodes"
    type        = number
    default     = 3
}