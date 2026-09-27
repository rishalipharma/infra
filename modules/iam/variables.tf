variable "project" {
    description = "Project Name"
    type        = string
}
variable "env" {
    description = "Environment Name(dev,qa,prod)"
    type        = string
}
variable "oidc_provider_arn" {
    description = "ARN of the EKS OIDC provider"
    type        = string
}
variable "oidc_provider_url" {
    description = "URL of the EKS OIDC provider"
    type        = string
}
variable "aws_account_id" {
    description = "AWS Account ID"
    type        = string
}
variable "github_org" {
    description = "GitHub Organization Name or username"
    type        = string
}
