## Root Module Structure

Our root module structure is as follows:

```
PROJECT_ROOT
│
├── main.tf                 # everything else.
├── variables.tf            # stores the structure of input variables
├── terraform.tfvars        # the data of variables we want to load into our terraform project
├── providers.tf            # defined required providers and their configuration
├── outputs.tf              # stores our outputs
└── README.md               # required for root modules
```

[Standard Module Structure](https://developer.hashicorp.com/terraform/language/modules/develop/structure)

### The Root Module
Every Terraform configuration has at least one module, known as its root module, which consists of the resources defined in the ``.tf `` files in the main working directory.

### Terraform Cloud Variables

Input variables let you customize aspects of Terraform modules without altering the module's own source code. This functionality allows you to share modules across different Terraform configurations, making your module composable and reusable. 

setting variables means connecting a resource to a variable which you can use the variable name to call back that reosurce. 

This is how we define a variable in the terraform.tfvars file
```
variable "image_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."
}
```
Here we are setting the variable
```
resource "aws_instance" "example" {
  instance_type = "t2.micro"
  ami           = var.image_id
}
```
Here we are using the variable name to apply the resource 
```
terraform apply -var="image_id=ami-abc123"
terraform apply -var='image_id_list=["ami-abc123","ami-def456"]' -var="instance_type=t2.micro"
terraform apply -var='image_id_map={"us-east-1":"ami-abc123","us-east-2":"ami-def456"}'
```

Modules are containers for multiple resources that are used together. A module consists of a collection of .tf and/or .tf.json files kept together in a directory.

In terraform we can set two kind of variables:
- Enviroment Variables - those you would set in your bash terminal eg. AWS credentials
- Terraform Variables - those that you would normally set in your tfvars file eg. user_uuid

We can set Terraform Cloud variables to be sensitive so they are not shown visibliy in the UI.

### Loading Terraform Input Variables

[Terraform Input Variables](https://developer.hashicorp.com/terraform/language/values/variables)

### var flag
We can use the `-var` flag to set an input variable or override a variable in the tfvars file eg. `terraform -var user_ud="my-user_id"`

### var-file flag

## Variable Definitions (.tfvars) Files
To set lots of variables, it is more convenient to specify their values in a variable definitions file (with a filename ending in either ``.tfvars`` or ``.tfvars.json)`` and then specify that file on the command line with ``-var-file``:

Note: This is how Terraform Cloud passes workspace variables to Terraform.

``
terraform apply -var-file="testing.tfvars"
``

### terraform.tvfars

This is the default file to load in terraform variables in blunk

### auto.tfvars

Terraform allows you to define variable files called ``*.tfvars`` to create a reusable file for all the variables for a project. The following is an example that covers all of the required variables to run a majority of the Terraform examples in this repository.

This means when you create a variable with this : ``*.tfvars`` you can use it to overide any environment.
## Environment Variables
As a fallback for the other ways of defining variables, Terraform searches the environment of its own process for environment variables named ``TF_VAR_`` followed by the name of a declared variable.

This can be useful when running Terraform in automation, or when running a sequence of Terraform commands in succession with the same variables. For example, at a ``bash`` prompt on a Unix system:
```sh
$ export TF_VAR_image_id=ami-abc123
$ terraform plan
```


On operating systems where environment variable names are case-sensitive, Terraform matches the variable name exactly as given in configuration, and so the required environment variable name will usually have a mix of upper and lower case letters as in the above example.

### Variable Definition Precedence
The above mechanisms for setting variables can be used together in any combination. If the same variable is assigned multiple values, Terraform uses the last value it finds, overriding any previous values. Note that the same variable cannot be assigned multiple values within a single source.

Terraform loads variables in the following order, with later sources taking precedence over earlier ones:

Environment variables
The ``terraform.tfvars`` file, if present.
The ``terraform.tfvars.json`` file, if present.
Any ``*.auto.tfvars`` or ``*.auto.tfvars.json`` files, processed in lexical order of their filenames.
Any ``-var`` and ``-var-file`` options on the command line, in the order they are provided. (This includes variables set by a Terraform Cloud workspace.)

## Dealing With Configuration Drift

## What happens if we lose our state file?

If you lose your statefile, you most likley have to tear down all your cloud infrastructure manually.

You can use terraform port but it won't for all cloud resources. You need check the terraform providers documentation for which resources support import.

### Fix Missing Resources with Terraform Import

`terraform import aws_s3_bucket.bucket bucket-name`

[Terraform Import](https://developer.hashicorp.com/terraform/cli/import)
[AWS S3 Bucket Import](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket#import)

### Fix Manual Configuration

If someone goes and delete or modifies cloud resource manually through ClickOps. 

If we run Terraform plan in an  attempt to put our infrastraucture back into the expected state fixing Configuration Drift

## Fix using Terraform Refresh

```sh
terraform apply -refresh-only -auto-approve
```

## Terraform Modules

### Terraform Module Structure

It is recommend to place modules in a `modules` directory when locally developing modules but you can name it whatever you like.

### Passing Input Variables

We can pass input variables to our module.
The module has to declare the terraform variables in its own variables.tf

```tf
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}
```