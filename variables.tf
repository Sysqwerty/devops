variable "region" {
  description = "AWS region for deployment"
  type        = string
  default     = "eu-central-1"
}

variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "eks-cluster-demo"
}

variable "instance_type" {
  description = "EC2 instance type for the worker nodes"
  type        = string
  default     = "t2.medium"
}

variable "ecr_repository_name" {
  description = "Name of the ECR repository"
  type        = string
  default     = "ecr-repo-18062025214500"
}