module "eks" {
    source = "terraform-aws-modules/eks/aws"
    version = "~> 21.0"

    name = "${var.project}-${var.env}-cluster"
    kubernetes_version = "1.27"

    vpc_id = var.vpc_id
    subnet_ids = var.subnet_ids

    endpoint_public_access = true #Allows kubectl access from your local machine. In production, you might restrict this to a VPN
    endpoint_private_access = true

    enable_irsa = true  #Creates the OIDC provider that powers IRSA (IAM Roles for Service Accounts)
    enable_cluster_creator_admin_permissions = true #Gives the IAM user who creates the cluster admin access to Kubernetes

    addons = {
        vpc-cni = {
            most_recent = true
            before_compute = true
        }
        kube-proxy = {
            most_recent = true
        }
        coredns = {
            most_recent = true
        }
        eks-pod-identity-agent = {
            most_recent = true
        }
    }

    eks_managed_node_groups = {
        eks_nodes = {
            desired_capacity = var.desired_size
            min_capacity     = var.min_size
            max_capacity     = var.max_size

            instance_types = var.instance_types

            tags = {
                Env     = var.env
                Project = var.project
            }
        }
    }
}