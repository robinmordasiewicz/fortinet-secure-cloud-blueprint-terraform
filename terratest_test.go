//go:build azure
// +build azure

// NOTE: We use build tags to differentiate azure testing because we currently do not have azure access setup for
// CircleCI.

package test

import (
	"testing"
  "context"

	"github.com/gruntwork-io/terratest/modules/azure"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
  "github.com/Azure/azure-sdk-for-go/sdk/azidentity"
  "github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/subscription/armsubscription"
)

var (
  subscriptionId = "fda770f9-b125-4474-abec-65a1cc1df596"
)
//const subscriptionID = "fda770f9-b125-4474-abec-65a1cc1df596"

//func setTerraformVariables() (map[string]string, error) {

	// Getting enVars from environment variables
//	ARM_CLIENT_ID := os.Getenv("AZURE_CLIENT_ID")
//	ARM_TENANT_ID := os.Getenv("AZURE_TENANT_ID")
//	ARM_SUBSCRIPTION_ID := os.Getenv("AZURE_SUBSCRIPTION_ID")

	// Creating globalEnVars for terraform call through Terratest
//	if ARM_CLIENT_ID != "" {
//		globalEnvVars["ARM_CLIENT_ID"] = ARM_CLIENT_ID
//		globalEnvVars["ARM_SUBSCRIPTION_ID"] = ARM_SUBSCRIPTION_ID
//		globalEnvVars["ARM_TENANT_ID"] = ARM_TENANT_ID
//	}

//	return globalEnvVars, nil
//}

func TestTerraformAzure(t *testing.T) {
	t.Parallel()
  cred, err := azidentity.NewDefaultAzureCredential(nil)
  if err != nil {
    log.Fatal("Invalid credentials with error: " + err.Error())
  }
  // Azure SDK Resource Management clients accept the credential as a parameter.
  // The client will authenticate with the credential as necessary.
	// subscriptionID is overridden by the environment variable "ARM_SUBSCRIPTION_ID"
	// subscriptionID := ""
	expectedAvsName := "fortinet-availability-set"
	//	uniquePostfix := random.UniqueId()

	// website::tag::1:: Configure Terraform setting up a path to Terraform code.
	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: ".",
   // EnvVars: globalEnvVars,
    NoColor: true,
    // Reconfigure is required if module deployment and go test pipelines are running in one stage
		Reconfigure: true,
	}

	// website::tag::4:: At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// website::tag::2:: Run `terraform init` and `terraform apply`. Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)

	//	availability_set_name := terraform.Output(t, terraformOptions, "availability_set_name")
	//	assert.Equal(t, "Hello, World!", availability_set_name)

	// Run `terraform output` to get the values of output variables
	subscriptionID := terraform.Output(t, terraformOptions, "current_subscription_id")
	resourceGroupName := terraform.Output(t, terraformOptions, "resource_group_name")

	// Check the Availability Set Exists
	actualAvsExists := azure.AvailabilitySetExists(t, expectedAvsName, resourceGroupName, subscriptionID)
	assert.True(t, actualAvsExists)

	// website::tag::3:: Run `terraform output` to get the values of output variables
	//	resourceGroupName := terraform.Output(t, terraformOptions, "resource_group_name")

	// website::tag::4:: Verify the resource group exists
	//	exists := azure.ResourceGroupExists(t, resourceGroupName, subscriptionID)
	//	assert.True(t, exists, "Resource group does not exist")
}
