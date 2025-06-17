module "resourcegroup" {
  source          = "git::https://github.com/rsanofi/tf-modules.git//resourcegroup?ref=v1.0.0"
  resource_groups = var.resource_groups
}

module "storage" {
  source              = "git::https://github.com/rsanofi/tf-modules.git//storage?ref=v1.0.0"
  resource_group_name = var.resource_group_name
  sa_additional_tags  = var.sa_additional_tags
  storage_accounts    = var.storage_accounts
  containers          = var.containers
  blobs               = var.blobs
  queues              = var.queues
  file_shares         = var.file_shares
  tables              = var.tables
  depends_on          = [module.resourcegroup]
}

module "vnet" {
  source              = "git::https://github.com/rsanofi/tf-modules.git//vnet?ref=v1.0.0"
  resource_group_name = var.resource_group_name
  net_location        = var.net_location
  net_additional_tags = var.net_additional_tags
  virtual_networks    = var.virtual_networks
  subnets             = var.subnets
  depends_on          = [module.resourcegroup]
}
