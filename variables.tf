variable "bucket_name" {
  description = "The name of the S3 bucket for Terraform state"
  type        = string
  default     = "terraform-state-bucket-18062025214500-alex"

}

variable "table_name" {
  description = "The name of the DynamoDB table for Terraform locks"
  type        = string
  default     = "terraform-locks"
}

variable "name" {
  description = "The name of the project"
  type        = string
  default     = "django-app-alex"
}

variable "region" {
  description = "AWS region for deployment"
  type        = string
  default     = "eu-central-1"
}

variable "instance_type" {
  description = "EC2 instance type for the worker nodes"
  type        = string
  default     = "t2.medium"
}

variable "repository_name" {
  description = "Name of the ECR repository"
  type        = string
  default     = "ecr-repo-18062025214500"
}

// github credentials

variable "github_pat" {
  description = "GitHub Personal Access Token"
  type        = string
}

variable "github_user" {
  description = "GitHub username"
  type        = string
}

variable "github_repo_url" {
  description = "GitHub repository name"
  type        = string
}

variable "github_branch" {
  description = "GitHub branch for Jenkins"
  type        = string
}

// RDS

variable "rds_use_aurora" {
  description = "Use Aurora for the RDS database"
  type        = bool
  default     = true
}

variable "rds_username" {
  description = "Username for the RDS database"
  type        = string
  default     = "postgres"
}

variable "rds_password" {
  description = "Password for the RDS database"
  type        = string
  sensitive   = true
}

variable "rds_database_name" {
  description = "Name of the RDS database"
  type        = string
  default     = "myapp"

}

variable "rds_publicly_accessible" {
  description = "Whether the RDS database should be publicly accessible"
  type        = bool
  default     = false
}

variable "rds_multi_az" {
  description = "Enable Multi-AZ for the RDS database"
  type        = bool
  default     = true
}

variable "rds_instance_class" {
  description = "Instance class for the RDS database"
  type        = string
  default     = "db.t4g.medium"
}

variable "rds_backup_retention_period" {
  description = "Backup retention period for the RDS database"
  type        = string
  default     = "7"
}

variable "rds_aurora_engine" {
  description = "Engine for Aurora RDS"
  type        = string
  default     = "aurora-postgresql"
}

variable "rds_aurora_engine_version" {
  description = "Engine version for Aurora RDS"
  type        = string
  default     = "15.3"
}

variable "rds_aurora_parameter_group_family" {
  description = "Parameter group family for Aurora RDS"
  type        = string
  default     = "aurora-postgresql15"
}

variable "rds_instance_engine" {
  description = "Engine for standard RDS instance"
  type        = string
  default     = "postgres"
}

variable "rds_instance_engine_version" {
  description = "Engine version for standard RDS instance"
  type        = string
  default     = "17.2"
}

variable "rds_instance_parameter_group_family" {
  description = "Parameter group family for standard RDS instance"
  type        = string
  default     = "postgres17"
}