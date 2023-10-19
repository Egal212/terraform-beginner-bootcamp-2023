 terraform {
required_providers  {
  aws = {
      source = "hashicorp/aws"
      version = "5.19.0"
    }
  }
}

    # Configuration options
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
# Bucket naming rules
# https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
resource "aws_s3_bucket" "website_bucket" {
    bucket = var.bucket_name

 

  tags = {
    UserUuid = var.user_uuid
   }
 } 