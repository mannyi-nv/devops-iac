# devops-iac-master

Terraform infrastructure-as-code for a multi-region AWS deployment with separate environment CIDR blocks and region-specific resources.

## Overview

This project provisions AWS resources in two regions:
- `us-west-2` (Oregon)
- `us-east-1` (N. Virginia)

It uses multiple `*.auto.tfvars` files to define environment-specific variables for `dev`, `test`, and `prod`.

## File layout

- `provider.tf` - AWS provider configuration and provider alias for N. Virginia
- `variables.tf` - shared variable definitions, environment selection, and CIDR mappings
- `terraform.tfvars` - default region settings, subnet counts, and common instance settings
- `*.auto.tfvars` - environment-specific variable values loaded automatically by Terraform
- `*.tf` - resource definitions for VPCs, subnets, security groups, NAT, EC2, and routing

## Auto variable file priority

Terraform automatically loads files ending in `.auto.tfvars`.
When more than one such file defines the same variable, the value from the file that sorts later alphabetically is used.

This repository uses numeric prefixes to establish that load order:
- `2_...` files are loaded before `3_...`
- `3_...` files are loaded before `4_...`

That means a file named `4_oregon_prod.auto.tfvars` has higher priority than `3_oregon_dev.auto.tfvars` if both define the same variable.

### Intended priority meaning in this project

- `2_` = test environment
- `3_` = dev environment
- `4_` = prod environment

Because Terraform loads auto variables alphabetically, the higher prefix number is treated as the later file and therefore the one that can override earlier values.

## Usage

From the repository root:

```bash
terraform init
terraform validate
terraform fmt -recursive
terraform plan
terraform apply
```

If you want to explicitly use a specific environment file instead of relying on automatic loading, pass the file with `-var-file`:

```bash
terraform apply -var-file=4_oregon_prod.auto.tfvars -var-file=4_n_virginia_prod.auto.tfvars
```

## Notes

- The default `terraform.tfvars` file contains shared values such as region names, subnet counts, and instance type.
- The `*.auto.tfvars` files define environment-specific subnet CIDRs and `env_type`.
- Sensitive provider values like AWS access key and secret should not be committed to source control.
