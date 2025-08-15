resource "azurerm_automation_account" "auto" {
  name                = var.automation_account_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "Basic"
}

resource "azurerm_automation_account_runbook" "runbook_update_management" {
  name                    = "Microsoft.SoftwareUpdateConfigurationRunbook"
  resource_group_name     = azurerm_automation_account.auto.resource_group_name
  automation_account_name = azurerm_automation_account.auto.name
  location                = azurerm_automation_account.auto.location
  log_verbose             = "false"
  log_progress            = "false"
  runbook_type            = "PowerShell"
  content                 = "Write-Output 'This is a placeholder runbook for Update Management'"
  description             = "Placeholder runbook for Update Management"
}

resource "azurerm_automation_account_link" "link" {
  automation_account_id = azurerm_automation_account.auto.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
}
