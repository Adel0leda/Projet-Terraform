variable "rgName" {
    type      = string
  description = "Ressource group name"
}

variable "region" {
    type      = string
  description = "Azure location"
}

variable "tag" {
    type      = string
  description = "Tag to use for the infrastructure"
}

variable "azure_subscription_id" {
    type      = string
  description = "Azure subscription id to use"
}

variable "azure_client_id" {
    type      = string
  description = "Azure app id to use"
}

variable "azure_client_secret" {
    type      = string
  description = "Azure app password to use"
}

variable "azure_tenant_id" {
    type      = string
  description = "Azure tenant id to use"
}

variable "azure_location" {
    type      = string
  description = "Azure location to use"
}

variable "azure_vnet" {
    type      = string
  description = "Azure VNET"
}

variable "azure_subnet" {
    type      = string
  description = "Azure subnet"
}

variable "public_ip" {
    type      = string
  description = "Azure Public IP"
}

variable "scaling" {
  type        = any
  default     = {}
}
variable "ip_restrictions" {
  type        = list(string)
  default     = []
}
variable "secure_app_settings" {
  type        = map(string)
  default     = {}
}
variable "runtime" {
  type        = any
  default     = {}
}
