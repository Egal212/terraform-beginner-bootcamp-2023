
variable "user_uuid" {
   description = "UUID for the user"
   type        = string
   validation {
      condition =  can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$",var.user_uuid))
      error_message = "User UUID must be in the format of a UUID (e.g., 123e4567-e89b-12d3-a456-426614174000)"
      }
    }

#variable "bucket_name" {
  #description = "The name of the bucket"
  #type = string
  #default     = "null"

  #validation {
    #condition        = (
      #length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63 &&
      #can(regex("^[a-z0-9[a-z0-9-.]*][a-z0-9]$",var.bucket_name))
    #)
    #error_message = "The bucket name must be between 3 and 63 characters"
  #}
#}
