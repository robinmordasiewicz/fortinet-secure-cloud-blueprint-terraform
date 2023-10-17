# fortinet-secure-cloud-blueprint-terraform

Azure Automation Fortinet Terraform.

[![MegaLinter](https://github.com/robinmordasiewicz/fortinet-secure-cloud-blueprint-terraform/workflows/MegaLinter/badge.svg?branch=main)](https://github.com/robinmordasiewicz/fortinet-secure-cloud-blueprint-terraform/actions?query=workflow%3AMegaLinter+branch%3Amain)

Configure pre-commit

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
