# Terraform CI-CD
This is a demo repository to showcase a possible Terraform CI/CD.

It follows the principle that CI/CD should not commit changes in your branch and you should be aware of errors before merging your Terraform code (CI checks) and fixing yourself.

## Dependencies
The CI/CD uses several tools to validate your Terraform code. It's expected that you have them installed locally.

- [Terraform](https://www.terraform.io/): Terraform is used to run common terraform commands, such as `terraform init`, `terraform plan`, `terraform apply`, `terraform providers lock`, `terraform validate`.
- [Tflint](https://github.com/terraform-linters/tflint): Tflint check possible errors and misconfigurations (e.g. EC2 instance types that do not exist), enforce best practices and naimng conventions. It uses the [tflint-ruleset-aws](https://github.com/terraform-linters/tflint-ruleset-aws) to enforce AWS best practices. It's configured via the `.tflint.hcl` file.
- [Terraform-docs](https://github.com/terraform-docs/terraform-docs/): Creates automatic markdown documentation for the terraform code and Terraform modules. It's being configured via the `.terraform-docs.yaml` file.
- [Trivy](https://github.com/aquasecurity/trivy): Finds vulnerabilities, misconfigurations and securities issues in the Terraform code. It's being configured via the `trivy.yaml` file.

This repository uses [Devbox](https://www.jetify.com/devbox) to manage the Development environment so you can install all needed tools just running `devbox shell`.

## Directory Structure

```
├── backend.tf    # Defines S3-based backend to store Terraform States
├── config        # Account-Region based backend configuration (S3 bucket + DynamoDB table)
├── modules       # Custom Terraform modules that will be used by the root Terraform project
├── vars          # Account-Region based files to declaratively define variables values
```

This project follows an Account-Region based deployment, i.e. an environment is treated as the combination of AWS Accont and AWS Region (e.g. us-east-1 resources in account 111111111111 is treated as a single environment).

## How does this CI/CD work?
There is a custom GitHub Actions (`./github/actions/terraform/action.yaml` file) action that is used to run terraform plan and apply commands in a given environment, please check the `./github/workflows/main.yaml` file to understand how this is being used. A `ci` Job was also created to validate formating, linting and security issues.

The best way to fully understand the CI/CD is to check its executions. Check the [PR](ADD PR LINK) to see it in action.


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.11.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.90 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Region to deploy the resources | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->