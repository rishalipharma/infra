output "vpc_id" {
    description = "VPC ID"
    value       = module.vpc.vpc_id
  
}
output "public_subnets" {
    description = "Public Subnet IDs"
    value       = module.vpc.public_subnets
}

output "private_subnets" {
    description = "Private Subnet IDs"
    value       = module.vpc.private_subnets
}

output "database_subnets" {
    description = "Database Subnet IDs"
    value       = module.vpc.database_subnets
}

output "database_subnet_group_name" {
    description = "Database Subnet Group Name"
    value       = module.vpc.database_subnet_group_name
}