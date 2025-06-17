variable "resource_groups" {
  description = "Resource groups to create."
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
}

variable "resource_group_name" {
  description = "Name of the resource group for storage and vnet modules."
  type        = string
}

variable "sa_additional_tags" {
  description = "Additional tags for storage accounts."
  type        = map(string)
  default     = {}
}

variable "storage_accounts" {
  description = "Storage accounts to create."
  type = map(object({
    name                     = string
    sku                      = string
    account_kind             = string
    access_tier              = string
    assign_identity          = bool
    min_tls_version          = string
    large_file_share_enabled = bool
    network_rules = object({
      bypass                     = list(string)
      default_action             = string
      ip_rules                   = list(string)
      virtual_network_subnet_ids = list(string)
    })
  }))
  default = {}
}

variable "containers" {
  description = "Storage containers to create."
  type = map(object({
    name                  = string
    storage_account_name  = string
    container_access_type = string
  }))
  default = {}
}

variable "blobs" {
  description = "Storage blobs to create."
  type = map(object({
    name                   = string
    storage_account_name   = string
    storage_container_name = string
    type                   = string
    size                   = number
    content_type           = string
    source_uri             = string
    metadata               = map(any)
  }))
  default = {}
}

variable "queues" {
  description = "Storage queues to create."
  type = map(object({
    name                 = string
    storage_account_name = string
  }))
  default = {}
}

variable "file_shares" {
  description = "Storage file shares to create."
  type = map(object({
    name                 = string
    storage_account_name = string
    quota                = number
  }))
  default = {}
}

variable "tables" {
  description = "Storage tables to create."
  type = map(object({
    name                 = string
    storage_account_name = string
  }))
  default = {}
}

variable "net_location" {
  description = "Location for vnet resources."
  type        = string
  default     = null
}

variable "net_additional_tags" {
  description = "Additional tags for vnet resources."
  type        = map(string)
  default     = {}
}

variable "virtual_networks" {
  description = "Virtual networks to create."
  type = map(object({
    name          = string
    address_space = list(string)
    dns_servers   = list(string)
    ddos_protection_plan = object({
      id     = string
      enable = bool
    })
  }))
  default = {}
}

variable "subnets" {
  description = "Subnets to create."
  type = map(object({
    name              = string
    vnet_key          = string
    vnet_name         = string
    address_prefixes  = list(string)
    service_endpoints = list(string)
    delegation = list(object({
      name = string
      service_delegation = list(object({
        name    = string
        actions = list(string)
      }))
    }))
  }))
  default = {}
}
