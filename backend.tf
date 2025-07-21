# Розкоментуйте, щоб підключити бекенд до Terraform

#terraform {
#  backend "s3" {
#    bucket         = "terraform-state-bucket-18062025214500"  # Назва S3-бакета
#    key            = "terraform.tfstate"                      # Шлях до файлу стейту
#    region         = "eu-central-1"                           # Регіон AWS
#    dynamodb_table = "use_lockfile"                           # Назва таблиці DynamoDB
#    encrypt        = true                                     # Шифрування файлу стейту
#  }
#}