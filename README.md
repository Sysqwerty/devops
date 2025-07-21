# Project goal

Build and deploy a complete DevOps infrastructure on AWS using Terraform, including the following components:

- Deploy a Kubernetes cluster (EKS) with CI/CD support
- Integrate Jenkins to automate build and deployment
- Install Argo CD for application management
- Configure a database (RDS or Aurora)
- Organize a container registry (ECR)
- Monitoring with Prometheus and Grafana

# Table of contents

- [Technical Details](#technical-details)
- [Prerequisites](#prerequisites)
- [Set up the environment](#set-up-the-environment)
- [Deploy application](#deploy-application)
- [Destroy the environment](#destroy-the-environment)

## Technical Details

`Infrastructure`: AWS using Terraform

`Components`: VPC, EKS, RDS, ECR, Jenkins, Argo CD, Prometheus, Grafana

## Prerequisites

- AWS CLI installed and configured
- kubectl installed
- Helm installed
- Docker installed
- Terraform installed

Optionally, you can add `terraform.tfvars` file to the root directory of the project.

This file can contain the following variables:

```hcl
github_repo_url = "https://github.com/<github_username>/<project_name>.git"
github_branch = "main"
github_username = "github_username"
github_token = "pat_token"

rds_password = "password_for_rds_db"
rds_publicly_accessible = true
rds_use_aurora = true
rds_multi_az = false
rds_backup_retention_period = "0"
```

## Set up the environment

For this task, we will use an EKS cluster in the `eu-central-1` region.

```sh
terraform init
terraform plan
terraform apply
```

## Deploy application

Now that the environment is set up, you can proceed with the rest of the tasks.

Connect kubectl to your cluster:
```sh
aws eks update-kubeconfig --region eu-central-1 --name <your_cluster_name>
```

Check the services in the cluster:
```sh
kubectl get svc -A
```

URL to created resources can be found in LoadBalancer URL.

Example:
![img.png](data/img.png)

Open Jenkins LoadBalancer URL (username: admin; password: admin123)
- Run the `seed-job` job (that will create new job `django-docker`)
- Run the `django-docker` job

Second job will:
- Build and push Docker image to ECR
- Merge MR in your repo with updating the app version (according to the Jenkins `django-docker` job build number)

![img2.png](data/img2.png)

Open Argo CD LoadBalancer URL
- check the status of `example-app` application (should be `Healthy` and `Synced`)

![img3.png](data/img3.png)

## Monitoring

- forward Grafana port using the next command
- - `kubectl port-forward -n monitoring svc/kube-prometheus-stack-grafana 3000:80`
- open URL http://localhost:3000
- login with username `admin` and password from the next command
- - `kubectl get secret --namespace monitoring kube-prometheus-stack-grafana -o jsonpath="{.data.admin-password}" | base64 --decode`
- check existing dashboards to see the CPU and Memory usage (PODs, Nodes etc.)

![img4.png](data/img4.png)

## Destroy the environment
```sh
terraform destroy
```