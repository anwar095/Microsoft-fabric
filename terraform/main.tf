resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_fabric_capacity" "example" {
  name                = "exampleffc"
  resource_group_name = azurerm_resource_group.example.name
  location            = "West Europe"

  administration_members = [data.azurerm_client_config.current.object_id]

  sku {
    name = "F32"
    tier = "Fabric"
  }

  tags = {
    environment = "test"
  }
}

resource "fabric_workspace" "example" {
  display_name = "example-workspace"
  description  = "Fabric Workspace created via Terraform"
  capacity_id  = azurerm_fabric_capacity.example.id

  identity = {
    type = "SystemAssigned"
  }
}

resource "fabric_workspace_role_assignment" "example" {
  workspace_id = "00000000-0000-0000-0000-000000000000"
  principal = {
    id   = "11111111-1111-1111-1111-111111111111"
    type = "User"
  }
  role = "Member"
}
resource "fabric_lakehouse" "example2" {
  display_name = "example2"
  description  = "example2 with enabled schemas"
  workspace_id = "00000000-0000-0000-0000-000000000000"

  configuration = {
    enable_schemas = true
  }
}
resource "fabric_warehouse" "example" {
  display_name = "warehouse_example"
  workspace_id = "11111111-1111-1111-1111-111111111111"
}

# Warehouse resource with enabled schemas
resource "fabric_warehouse" "example2" {
  display_name = "warehouse_example2"
  description  = "warehouse_example2 with collation_type"
  workspace_id = "00000000-0000-0000-0000-000000000000"

  configuration = {
    collation_type = "Latin1_General_100_BIN2_UTF8"
  }
}
