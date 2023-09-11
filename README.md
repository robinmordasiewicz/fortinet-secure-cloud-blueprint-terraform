# fortinet-secure-cloud-blueprint-terraform

https://learn.microsoft.com/en-us/azure/active-directory/saas-apps/media/fortigate-ssl-vpn-tutorial/fortigate-deployment-guide-converted?wt.mc_id=searchAPI_azureportal_inproduct_rmskilling&sessionId=87fe3bdc9f7449b6a8189c9250559e3b

https://learn.microsoft.com/en-us/samples/azure-samples/github-terraform-oidc-ci-cd/github-terraform-oidc-ci-cd/

https://learn.microsoft.com/en-us/azure/developer/github/connect-from-azure

https://learn.microsoft.com/en-us/azure/storage/common/storage-account-create

https://learn.microsoft.com/en-us/azure/developer/terraform/store-state-in-azure-storage

https://github.com/Azure-Samples/terraform-github-actions

https://docs.github.com/en/actions/deployment/targeting-different-environments/using-environments-for-deployment#creating-an-environment

https://learn.microsoft.com/en-us/azure/deployment-environments/tutorial-deploy-environments-in-cicd-github

https://github.com/Azure-Samples/terraform-github-actions

https://github.com/Azure-Samples/terraform-github-actions/blob/main/.github/workflows/tf-plan-apply.yml

```
export TF_CLI_ARGS_init="-backend-config=backend.hcl"
terraform output -raw admin_password
terraform output -raw tls_private_key
```

```
git checkout main
git pull
git checkout <local-branch>
git merge main
```

```
gh workflow run terraform-action.yml --ref Production -R robinmordasiewicz/fortinet-secure-cloud-blueprint-terraform
