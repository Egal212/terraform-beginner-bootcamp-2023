# output "bucket_name" {

#   description = "Bucket name for our static website hosting"
#   value = "website4565"
# }

output "website_endpoint" {
  description = "s3 static website hosting endpoint"
  value = "aws_s3_bucket_website_configuration.website_configuration.website_endpoint"
}