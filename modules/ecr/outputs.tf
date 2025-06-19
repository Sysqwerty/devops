output "repository_url" {
  description = "Повний URL (hostname/імена) для docker push/pull."
  value       = "https://${aws_ecr_repository.ecr.repository_url}"
}

output "repository_arn" {
  description = "ARN створеного репозиторію."
  value       = aws_ecr_repository.ecr.arn
}