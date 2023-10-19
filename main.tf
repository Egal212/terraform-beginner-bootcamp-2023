terraform {
  #backend "remote" {
    #hostname = "app.terraform.io"
    #organization = "org-name"
  #}

  #workspaces {
    #name = "terra-house-1"
#  }
# }
#cloud {
  #organization = "org-name"
  #worjspaces{
    #name = "terra-huse-1"
  #}
#}


#
# cloud {
  #   organization = "dev-glo"
  #   workspaces {
  #     name = "Terrahouse-1"
  #   }
  # }


}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  bucket_name = "var.bucket_name"
  user_uuid = "var.user_uuid"


}
