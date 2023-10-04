# Terraform Beginner Bootcamp 2023

Semantic Versioning 🧙
This project is going to utilise semantic versioning for its tagging .
[semver.org](https://semver.org/)

The general format will be

Given a version number **MAJOR.MINOR.PATCH**, e.g '1.0.1'

**MAJOR** version when you make incompatible API changes
**MINOR** version when you add functionality in a backward compatible manner
**PATCH** version when you make backward-compatible bug fixes Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

## Install the terraform ClI

The TERRAFORM ClI installation instruction have changed due to gpgp keyring changes. 
[Install the terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Refactoring into Bash Scripts

While fixing the Terraform CLI gpg depreciation issues,we noticed that the bash script steps were a considerable amount more code so  we created a new BASH SCRIPT (bash_script)[./bin/install_terraform_CLI]'install_terraform_CLI' TO INSTALL THE TERRAFORM CLI.

- This will keep the gitpod task file ([.gitpod.yml]) tidy.
- This allows us an easier to debug and execute manually Terraform CLI install.
- This will allow better portability for other projects that need to install Terraform CLI

### Considerations for Linux Distributions 

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



