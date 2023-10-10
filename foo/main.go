package main

import (
  "context"

  "github.com/Azure/azure-sdk-for-go/sdk/azidentity"
  "github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/subscription/armsubscription"
)

const subscriptionID = "fda770f9-b125-4474-abec-65a1cc1df596"

func main() {
  cred, err := azidentity.NewDefaultAzureCredential(nil)
  if err != nil {
    // TODO: handle error
  }
  // Azure SDK Resource Management clients accept the credential as a parameter.
  // The client will authenticate with the credential as necessary.
  client, err := armsubscription.NewSubscriptionsClient(cred, nil)
  if err != nil {
    // TODO: handle error
  }
  _, err = client.Get(context.TODO(), subscriptionID, nil)
  if err != nil {
    // TODO: handle error
  }
}
