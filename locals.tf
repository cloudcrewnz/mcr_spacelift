locals {
  provider = {
    github = "github"
    azure  = "azuredevops"
  }
  yaml_files    = fileset("configs", "*.yml")
  decoded_maps  = [for curr_file in local.yaml_files : yamldecode(file("${path.module}/configs/${curr_file}"))]
  loaded_spaces = flatten([for m in local.decoded_maps : [for space in try(m.spaces, {}) : space]])
  merged_spaces = { for space in local.loaded_spaces : space.id => space }
  config        = merge(local.decoded_maps...)
}
