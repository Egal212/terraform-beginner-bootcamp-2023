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
  #workspaces{
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
  user_uuid = var.user_uuid
  index_html_filepath = var.index_html_filepath 
  error_html_filepath = var.error_html_filepath
  #bucket_name = var.bucket_name


}
