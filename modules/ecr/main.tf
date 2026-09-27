resource "aws_ecr_repository" "main" {
    for_each = toset(var.repositories)  #Creates one ECR repo per microservice from a list. No copy-paste needed.

    name                 = each.value
    image_tag_mutability = "MUTABLE"

    image_scanning_configuration {
        scan_on_push = true #Automatically scans images for vulnerabilities when pushed
    }

    tags = {
        Name        = "${var.project}-${each.value}"
        Project     = var.project
        Environment = var.env
    }
 }

 resource "aws_ecr_lifecycle_policy" "main" {
   for_each = toset(var.repositories) #Creates one ECR repo per microservice from a list. No copy-paste needed.
   repository = aws_ecr_repository.main[each.key].name

   policy = jsonencode({
     rules = [
       {
         rulePriority = 1
         description  = "Keep last 10 images"
         selection    = {
           tagStatus    = "any"
           countType    = "imageCountMoreThan"
           countNumber  = 10
         }
         action       = {
           type = "expire"
         }
       }
     ]
   })
 }