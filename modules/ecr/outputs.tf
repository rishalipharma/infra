output "repository_urls" {
    
  description = "The URLs of the ECR repositories"
  value       = { for name, repo in aws_ecr_repository.main : name => repo.repository_url }
}