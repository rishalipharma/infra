variable "project" {
  description = "Project name"
  type = string
}
variable "env" {
  description = "Environment name (dev, qa, prod)"
  type = string
}
variable "repositories" {
  description = "Name of the ECR repository"
  type = list(string)
}