//go:build azure
// +build azure

// NOTE: We use build tags to differentiate azure testing because we currently do not have azure access setup for
// CircleCI.

package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/azure"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformAzure(t *testing.T) {
	t.Parallel()

	// subscriptionID is overridden by the environment variable "ARM_SUBSCRIPTION_ID"
	// subscriptionID := ""
	subscriptionID := terraform.Output(t, terraformOptions, "current_subscription_id")
  expectedAvsName := "fortinet-availability-set"
//	uniquePostfix := random.UniqueId()

	// website::tag::1:: Configure Terraform setting up a path to Terraform code.
	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: ".",
	}

	// website::tag::4:: At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// website::tag::2:: Run `terraform init` and `terraform apply`. Fail the test if there are any errors.
	terraform.InitAndApply(t, terraformOptions)

//	availability_set_name := terraform.Output(t, terraformOptions, "availability_set_name")
//	assert.Equal(t, "Hello, World!", availability_set_name)

  // Run `terraform output` to get the values of output variables
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
