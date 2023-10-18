# terraform-docs

Azure Automation Fortinet Terraform.

[![MegaLinter](https://github.com/robinmordasiewicz/fortinet-secure-cloud-blueprint-terraform/workflows/MegaLinter/badge.svg?branch=main)](https://github.com/robinmordasiewicz/fortinet-secure-cloud-blueprint-terraform/actions?query=workflow%3AMegaLinter+branch%3Amain)
=======
[![Build Status](https://github.com/terraform-docs/terraform-docs/workflows/ci/badge.svg)](https://github.com/terraform-docs/terraform-docs/actions) [![GoDoc](https://pkg.go.dev/badge/github.com/terraform-docs/terraform-docs)](https://pkg.go.dev/github.com/terraform-docs/terraform-docs) [![Go Report Card](https://goreportcard.com/badge/github.com/terraform-docs/terraform-docs)](https://goreportcard.com/report/github.com/terraform-docs/terraform-docs) [![Codecov Report](https://codecov.io/gh/terraform-docs/terraform-docs/branch/master/graph/badge.svg)](https://codecov.io/gh/terraform-docs/terraform-docs) [![License](https://img.shields.io/github/license/terraform-docs/terraform-docs)](https://github.com/terraform-docs/terraform-docs/blob/master/LICENSE) [![Latest release](https://img.shields.io/github/v/release/terraform-docs/terraform-docs)](https://github.com/terraform-docs/terraform-docs/releases)


```bash
git config --global init.templateDir ~/.git-template
pre-commit init-templatedir ~/.git-template
git clone https://github.com/robinmordasiewicz/fortinet-secure-cloud-blueprint-terraform
```

```bash
export TF_CLI_ARGS_init="-backend-config=backend.hcl"
terraform output -raw admin_password
terraform output -raw tls_private_key
```

```bash
git checkout main
git pull
git checkout <local-branch>
git merge main
```

```bash
gh workflow run environment.yml --ref Production -R robinmordasiewicz/fortinet-secure-cloud-blueprint-terraform
```

```bash
trivy fs --scanners vuln,config .
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

