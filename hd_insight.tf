resource "azurerm_storage_account" "hdinsight" {
  name                     = "terraformlesgi5src2hdinsight"
  resource_group_name      = azurerm_resource_group.RG1.name
  location                 = azurerm_resource_group.RG1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "hdinsight" {
  name                  = "hdinsight"
  storage_account_name  = azurerm_storage_account.hdinsight.name
  container_access_type = "private"
}

resource "azurerm_hdinsight_interactive_query_cluster" "esgi" {
  name                = "esgi-hdicluster"
  resource_group_name = azurerm_resource_group.RG1.name
  location            = azurerm_resource_group.RG1.location
  cluster_version     = "3.6"
  tier                = "Standard"

  component_version {
    interactive_hive = "2.1"
  }

  gateway {
    enabled  = true
    username = "acctestusrgw"
    password = "TerrAform123!"
  }

  storage_account {
    storage_container_id = azurerm_storage_container.hdinsight.id
    storage_account_key  = azurerm_storage_account.hdinsight.primary_access_key
    is_default           = true
  }

  roles {
    head_node {
      vm_size  = "Standard_A5"
      username = "acctestusrvm"
      password = "AccTestvdSC4daf986!"
    }

    worker_node {
      vm_size               = "Standard_A5"
      username              = "acctestusrvm"
      password              = "AccTestvdSC4daf986!"
      target_instance_count = 1
    }

    zookeeper_node {
      vm_size  = "Standard_A5"
      username = "acctestusrvm"
      password = "AccTestvdSC4daf986!"
    }
  }
}
