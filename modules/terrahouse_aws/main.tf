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
    bucket = "website4565.bucket"
    

 tags = {
    UserUuid = var.user_uuid
   }
 } 

 resource "aws_s3_bucket_website_configuration" "website_configuration" {
  bucket = "website4565.bucket"

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

  resource "aws_s3_object" "index-html" {
    bucket = "website4565.bucket"
    key    = "index.html"
    source = var.index_html_filepath

    etag = filemd5(var.index_html_filepath)
  }

  resource "aws_s3_object" "error-html" {
    bucket = "website4565.bucket"
    key    = "error.html"
    source = var.error_html_filepath

    etag = filemd5(var.error_html_filepath)
  }