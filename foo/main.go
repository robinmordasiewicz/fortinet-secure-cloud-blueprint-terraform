package main

import (
	"github.com/Azure/azure-sdk-for-go/sdk/azidentity"
	"log"
	 "github.com/Azure/azure-sdk-for-go/sdk/resourcemanager/resources/armresources"
)

var (
	subscriptionId = "fda770f9-b125-4474-abec-65a1cc1df596"
)

func main() {
	cred, err := azidentity.NewDefaultAzureCredential(nil)
	if err != nil {
		log.Fatal("Invalid credentials with error: " + err.Error())
		// TODO: handle error
	}
	client, _ := armresources.NewClient(subscriptionId, cred, nil)
	log.Print("Great, You are Authenticated to subscription", client)
}
