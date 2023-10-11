package test

import (
	"testing"
  "log"

//	"github.com/gruntwork-io/terratest/modules/azure"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
  "github.com/Azure/azure-sdk-for-go/sdk/azidentity"
  "github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/resources/armresources"
)

var (
  subscriptionId = "fda770f9-b125-4474-abec-65a1cc1df596"
)

func TestTerraformAzure(t *testing.T) {
	t.Parallel()
  // Azure SDK Resource Management clients accept the credential as a parameter.
  // The client will authenticate with the credential as necessary.
	// subscriptionID is overridden by the environment variable "ARM_SUBSCRIPTION_ID"
	// subscriptionID := ""
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

	availability_set_name := terraform.Output(t, terraformOptions, "availability_set_name")
	assert.Equal(t, "fortinet-availability-set", availability_set_name)

	// Run `terraform output` to get the values of output variables
  cred, err := azidentity.NewDefaultAzureCredential(nil)
  if err != nil {
    log.Fatal("Invalid credentials with error: " + err.Error())
  }
  // Azure Resource Management clients accept the credential as a parameter
  client, err := armresources.NewClient("fda770f9-b125-4474-abec-65a1cc1df596", cred, nil)
  if err != nil {
    log.Fatal("Invalid credentials with error: " + err.Error())
  }

  client, _ := armresources.NewClient(subscriptionId, cred, nil)
  log.Print("Great, You are Authenticated to subscription", client)

	// Check the Availability Set Exists
//	subscriptionID := terraform.Output(t, terraformOptions, "current_subscription_id")
//	resourceGroupName := terraform.Output(t, terraformOptions, "resource_group_name")
//	expectedAvsName := "fortinet-availability-set"
	//actualAvsExists := azure.AvailabilitySetExists(t, expectedAvsName, resourceGroupName, subscriptionID)
	//assert.True(t, actualAvsExists)

	// website::tag::3:: Run `terraform output` to get the values of output variables
	//	resourceGroupName := terraform.Output(t, terraformOptions, "resource_group_name")

	// website::tag::4:: Verify the resource group exists
	//	exists := azure.ResourceGroupExists(t, resourceGroupName, subscriptionID)
	//	assert.True(t, exists, "Resource group does not exist")
}
