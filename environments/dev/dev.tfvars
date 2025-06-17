resource_groups = {
  dev_rg = {
    name     = "dev-rg"
    location = "eastus2"
    tags = {
      environment = "dev"
      owner       = "dev-team"
    }
  }
}

resource_group_name = "dev-rg"
sa_additional_tags  = { 
  environment = "dev"
  iac = "terraform" 
}
storage_accounts = {
  devsa = {
    name                     = "rsanofidevstorageacct"
    sku                      = "Standard_LRS"
    account_kind             = null
    access_tier              = null
    assign_identity          = true
    min_tls_version          = "TLS1_2"
    large_file_share_enabled = false
    network_rules            = null
  }
}

containers = {
  container1 = {
    name                  = "test"
    storage_account_name  = "rsanofidevstorageacct"
    container_access_type = "private"
  }
}
blobs = {}
queues = {}
file_shares = {}
tables = {}

net_location        = null
net_additional_tags = { 
  environment = "dev"
  iac = "terraform"
}
virtual_networks = {
  virtualnetwork1 = {
    name                 = "rsanofidevvnet"
    address_space        = ["10.0.0.0/16"]
    dns_servers          = null
    ddos_protection_plan = null
  }
}
subnets = {
  subnet1 = {
    vnet_key          = "virtualnetwork1"
    vnet_name         = rsanofidevvnet
    name              = "loadbalancer"
    address_prefixes  = ["10.0.1.0/24"]
    service_endpoints = ["Microsoft.Sql", "Microsoft.AzureCosmosDB"]
    delegation        = []
  },
  subnet2 = {
    vnet_key          = "virtualnetwork1"
    vnet_name         = rsanofidevvnet
    name              = "app"
    address_prefixes  = ["10.0.2.0/24"]
    service_endpoints = null
    delegation        = []
  }
}
