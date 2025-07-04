#output "s3_bucket_name" {
#    description = "Назва S3-бакета для стейтів"
#    value       = aws_s3_bucket.terraform_state.bucket
#}
#
#output "s3_bucket_url" {
#  description = "URL S3-бакета для стейтів"
#  value       = "https://${aws_s3_bucket.terraform_state.bucket_regional_domain_name}"
#}
#
#output "dynamodb_table_name" {
#  description = "Назва таблиці DynamoDB для блокування стейтів"
#  value       = aws_dynamodb_table.terraform_locks.name
#}