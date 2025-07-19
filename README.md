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

## Steps to set up the environment

For this task, we will use an EKS cluster in the `eu-central-1` region.

```sh
terraform init
terraform plan
terraform apply
```

## Next steps

Now that the environment is set up, you can proceed with the rest of the tasks.

Check the services in the cluster:
```sh
aws eks update-kubeconfig --region eu-central-1 --name <your_cluster_name>
kubectl get svc -A
```

Take the LoadBalancer URL from the output of the previous command and open it in your browser.

ARGO_CD creds:
- username: admin
- password:
```sh
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath={.data.password} | base64 -d
```

Jenkins creds:
- username: admin
- password: admin123

## Destroy the environment
```sh
terraform destroy
```