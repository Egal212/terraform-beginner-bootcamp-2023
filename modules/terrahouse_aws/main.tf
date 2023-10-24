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


#[Caller Identity link](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity)
data "aws_caller_identity""current" {}