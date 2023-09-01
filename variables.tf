variable "azure_region" {
  description = "Azure region for resources."
  type        = string
}
variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}
variable "azure_username" {
  description = "Azure username for resource group tag"
  type        = string
}
variable "vnetAddressPrefix" {
  description = "Virtual Network Address prefix"
  type        = string
}

variable "external-Name" {
  description = "External Subnet Name"
  type        = string
}

variable "external-Prefix" {
  description = "External Subnet Prefix"
  type        = string
}

variable "internal-Name" {
  description = "Internal Subnet Name"
  type        = string
}

variable "internal-Prefix" {
  description = "Internal Subnet Prefix"
  type        = string
}

variable "dmz-Name" {
  description = "DMZ Subnet Name"
  type        = string
}

variable "dmz-Prefix" {
  description = "DMZ Subnet Prefix"
  type        = string
}

