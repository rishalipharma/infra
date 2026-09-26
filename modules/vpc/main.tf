module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    version = "~> 6.0"

    name = "${var.project}-${var.env}-vpc"
    cidr = var.vpc_cidr

    azs = ["${var.region}a", "${var.region}b"]
    public_subnets  = var.public_subnet_cidr
    private_subnets = var.private_subnet_cidr
    database_subnets = var.database_subnet_cidr

    enable_nat_gateway = true
    single_nat_gateway = true   
    #Uses one NAT Gateway instead of one per AZ. 
    #Saves ~$30/month but is a single point of failure. Fine for dev, not for production.
    
    enable_dns_hostnames = true
    enable_dns_support = true
    create_database_subnet_group = true

    public_subnet_tags = {
        "kubernetes.io/role/elb" = "1"
    }

    private_subnet_tags = {
        "kubernetes.io/role/internal-elb" = "1"
        # The kubernetes.io/role/elb and kubernetes.io/role/internal-elb tags tell the
        # AWS Load Balancer Controller which subnets to use when creating ALBs.
        "kubernetes.io/cluster/${var.project}-${var.env}-cluster" = "owned"
    }

    tags = {
        "Project"     = var.project
        "Environment" = var.env
    }
}