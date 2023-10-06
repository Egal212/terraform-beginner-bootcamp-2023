# Terraform Beginner Bootcamp 2023

Semantic Versioning 🧙
This project is going to utilise semantic versioning for its tagging .
[semver.org](https://semver.org/)

The general format will be

Given a version number **MAJOR.MINOR.PATCH**, e.g '1.0.1'

**MAJOR** version when you make incompatible API changes
**MINOR** version when you add functionality in a backward compatible manner
**PATCH** version when you make backward-compatible bug fixes Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

#### the terraform ClI

The TERRAFORM ClI installation instruction have changed due to gpgp keyring changes. 
[Install the terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

#### Refactoring into Bash Scripts

While fixing the Terraform CLI gpg depreciation issues,we noticed that the bash script steps were a considerable amount more code so  we created a new BASH SCRIPT (bash_script)[./bin/install_terraform_CLI]'install_terraform_CLI' TO INSTALL THE TERRAFORM CLI.

- This will keep the gitpod task file ([.gitpod.yml]) tidy.
- This allows us an easier to debug and execute manually Terraform CLI install.
- This will allow better portability for other projects that need to install Terraform CLI

#### Considerations for Linux Distributions 

This projects is built against Ubuntu.
Please consider checking your Linux Distribution and change accordingly to your needs.

[How to check os version in Linux](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)

Example of checking Os Version: 
```sh
$ cat /etc/os-release

PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```
[Shebang Considerations](https://en.wikipedia.org/wiki/Shebang_(Unix))
A shebang tells the bash script what program that will interpret the script eg. ``#!/bin/bash``


#### Gitpod Lifecycle

We need to be careful when using the Init because it will not rerun if we restart an existing workspace.

https://www.gitpod.io/docs/configure/workspaces/tasks



#### Working with Env Vars

#### env commands 

We can list out all Enviroment Variables (Env Vars) using the `env` command

We can filter specific env vars using grep eg. `env | grep AWS_`

Setting and Unsetting Env Vars

In the terminal we can set using `export HELLO='world`

In the terminal we unset using `unset HELLO`

We can set an env var temporarily when just running a command

``` bsh
HELLO='world' ./bin/print_message

```
Within a bash script we can set env without writing export eg.

```
#!/usr/bin/env bash

HELLO='world'

echo $HELLO
```

#### Printing Vars

We can print an env var using echo eg. ``echo $HELLO``

#### Scoping of Env Vars

When you open up new bash terminals in VSCode it will not be aware of env vars that you have set in another window.

If you want to Env Vars to persist across all future bash terminals that are open you need to set env vars in your bash profile. eg. ``.bash_profile``

Persisting Env Vars in Gitpod

We can persist env vars into gitpod by storing them in Gitpod Secrets Storage.

```
gp env HELLO='world'
```

All future workspaces launched will set the env vars for all bash terminals opened in those workspaces.


You can also set env vars in the ``.gitpod.yml`` but this can only contain non-senstive env vars.

#### AWS CLI INSTALLATION

AWS CLI is installed for the project via the bash script [Bin_install_aws_CLI]`./bin/install_aws_cli`

[Getting Started Install (AWS CLI)](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) [AWS CLI Env Vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

We can check if our AWS credentials is configured correctly by running the following AWS CLI command:
```sh
aws sts get-caller-identity

```
If it is succesful you should see a json payload return that looks like this:
```sh

{
    "UserId": "AIEAVUO15ZPVHJ5WIJ5KR",
    "Account": "123456789012",
    "Arn": "arn:aws:iam::123456789012:user/terraform-beginner-bootcamp"
}
```

We'll need to generate AWS CLI credits from IAM User in order to the user AWS CLI.


