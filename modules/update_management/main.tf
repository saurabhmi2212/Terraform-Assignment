resource "azurerm_automation_software_update_configuration" "patch_schedule" {
  name                      = var.update_config_name
  automation_account_id     = var.automation_account_id
  virtual_machine_ids       = var.virtual_machine_ids

  linux {
    reboot_option = "RebootIfRequired"
  }

  schedule {
    frequency  = "Week"
    interval   = 1
    start_time = var.start_time
    time_zone  = "UTC"
  }
}
