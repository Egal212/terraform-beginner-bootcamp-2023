
resource "aws_s3_bucket" "website_bucket" {
    bucket = "website_bucket"
    

 tags = {
    UserUuid = "var.user_uuid"
   }
 } 

 resource "aws_s3_bucket_website_configuration" "website_configuration" {
  bucket = "website_bucket"

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

  resource "aws_s3_object" "index-html" {
    bucket = "website_bucket"
    key    = "index.html"
    source = workspace/terraform-beginner-bootcamp-2023/public/index.html

    etag = filemd5(/workspace/terraform-beginner-bootcamp-2023/public/index.html)
  }

  resource "aws_s3_object" "error-html" {
    bucket = "website_bucket"
    key    = "error.html"
    source = workspace/terraform-beginner-bootcamp-2023/public/error.html

    etag = filemd5(/workspace/terraform-beginner-bootcamp-2023/public/erro.html)
  }

  resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = "website_bucket"
  #policy = data.aws_iam_policy_document.allow_access_from_another_account.json
  policy = jsonencode ({

    "Version" = "2012-10-17",
    "Statement" = {
        "Sid" = "AllowCloudFrontServicePrincipalReadOnly",
        "Effect"= "Allow",
        "Principal"= {
            "Service"= "cloudfront.amazonaws.com"
        },
        "Action"= "s3:GetObject",
        "Resource"= "arn:aws:s3:::website_bucket.id/*",
        "Condition"= {
        "StringEquals"= {
            #"AWS:SourceArn": data.aws_caller_identity.current.arn 
            "AWS:SourceArn"= "arn:aws:cloudfront::${data.aws_caller_identity.current.account_id}:distribution/${aws_cloudfront_distribution.s3_distribution.id}"
                }
            }
        },
  })
}
