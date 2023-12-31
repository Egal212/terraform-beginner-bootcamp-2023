
variable "user_uuid" {
   description = "UUID for the user"
   type        = string
   validation {
      condition =  can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$",var.user_uuid))
      error_message = "User UUID must be in the format of a UUID (e.g., 123e4567-e89b-12d3-a456-426614174000)"
      }
    }

    variable "index_html_filepath" {
      description = "The file path for index.html"
      type = string

      validation {
        condition = fileexists(var.index_html_filepath)
        error_message = "The provided path for index.html does not exist"
      }
   }
    
     variable "error_html_filepath" {
      description = "The file path for error.html"
      type = string

      validation {
        condition = fileexists(var.error_html_filepath)
        error_message = "The provided path for error.html does not exist"
    }
    }
 variable "bucket_name" {
   description = "The name of the S3 bucket"
   type = string



   validation {
     condition        = (
      length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63 &&
       can(regex("^[a-z0-9[a-z0-9-.]*[a-z0-9]$",var.bucket_name))
     )
   error_message = "The bucket name must be between 3 and 63 characters"
   }
 }
