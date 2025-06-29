# Steps

!!! Make sure you have installed `Terraform` and `Helm` on your system.

## Terraform

Ініціалізація Terraform:

```bash
terraform init
```

Перевірка змін:

```bash
terraform plan
```

Застосування змін:

```bash
terraform apply
```

Завантажити django image на новостворений ECR-репозиторій:

```bash
docker tag django_image:latest $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPOSITORY:latest
docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPOSITORY:latest
```

where `django_image:latest` your django image name that already exists in your local machine.

Replace $AWS_ACCOUNT_ID, $AWS_REGION, and $ECR_REPOSITORY with your own values.

## Helm

Застосування Helm:

```bash
cd charts/django-app
helm install my-django .
```

where `my-django` is your helm chart name.

# Видалення ресурсів:

Kubernetes (PODs, Services, Deployments etc.)
```bash
helm uninstall my-django
```

where `my-django` is your helm chart name.

Terraform (EKS, VPC, ECR etc.)

```bash
terraform destroy
```

# Додаткова інформація:

Якщо ви хочете оновити helm chart:

```bash
helm upgrade my-django .
```

Якщо ви хочете оновити terraform:

```bash
terraform init -upgrade
terraform plan
terraform apply
```

# Опис модулів terraform

## s3-backend

Модуль для створення S3-бакета для збереження стейтів.
В модулі створюється S3-бакет, налаштовується версіонування та контроль власності.
Також створюється DynamoDB-таблиця для блокування стейтів.

## vpc

Модуль для створення VPC.
В модулі встановлена VPC, публічні підмережі, приватні підмережі та зони доступності.
Також створюється NAT Gateway, Internet Gateway та таблиці роутів для доступу до інтернету.

## ecr

Модуль для створення ECR-репозиторію.
В модулі створюється репозиторій ECR, налаштовується автоматичне сканування security-вразливостей під час push.

## eks

Модуль для створення EKS-кластера.
В модулі створюється EKS-кластер, налаштовується автоматичне сканування security-вразливостей під час push.
