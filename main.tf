terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
  }
}

provider "aws" {
  region = var.region
}

## Підключаємо модуль для S3 та DynamoDB
#module "s3_backend" {
#  source      = "./modules/s3-backend"                    # Шлях до модуля
#  bucket_name = "terraform-state-bucket-18062025214500"   # Ім'я S3-бакета
#  table_name  = "use_lockfile"                            # Ім'я DynamoDB
#}

# Підключаємо модуль для VPC
module "vpc" {
  source             = "./modules/vpc"                                      # Шлях до модуля VPC
  vpc_cidr_block     = "10.0.0.0/16"                                        # CIDR блок для VPC
  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]        # Публічні підмережі
  private_subnets    = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]        # Приватні підмережі
  availability_zones = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]  # Зони доступності
  vpc_name           = var.vpc_name                                         # Ім'я VPC
}

# Підключаємо модуль для ECR
module "ecr" {
  source = "./modules/ecr"

  repository_name = var.repository_name          # Ім'я репозиторію
  scan_on_push    = true                         # true → увімкнути

  # власна policy (публічний read‑only доступ)
  #  repository_policy = jsonencode({
  #    Version   = "2012-10-17",
  #    Statement = [
  #      {
  #        Sid       = "PublicRead",
  #        Effect    = "Allow",
  #        Principal = "*",
  #        Action    = ["ecr:GetDownloadUrlForLayer", "ecr:BatchGetImage", "ecr:BatchCheckLayerAvailability"]
  #      }
  #    ]
  #  })
}

module "eks" {
  source        = "./modules/eks"
  cluster_name  = var.cluster_name              # Назва кластера
  subnet_ids    = module.vpc.public_subnets     # ID підмереж
  instance_type = "t2.medium"                   # Тип інстансів
  desired_size  = 2                             # Бажана кількість нодів
  max_size      = 3                             # Максимальна кількість нодів
  min_size      = 1                             # Мінімальна кількість нодів
}
