#------------------------------------------------------------------------------#
# Azure AD module - retrieve service principal id for the Client ID
#------------------------------------------------------------------------------#
data "azuread_client_config" "current" {}

data "azuread_service_principal" "provider" {
  client_id = data.azuread_client_config.current.client_id
}


# resource "azuredevops_project" "ado_project" {
#   name               = "Spacelift_Project"
#   visibility         = "private"
#   version_control    = "Git"
#   work_item_template = "Agile"
# }
# resource "azuredevops_project" "ado_project" {
#   name               = "Spacelift_Project"
#   visibility         = "private"
#   version_control    = "Git"
#   work_item_template = "Agile"
# }
