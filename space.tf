data "spacelift_account" "this" {}

locals {
  spaces_exists = {
    for key, value in local.merged_spaces : key => value if value.exists == true
  }
  spaces = {
    for key, value in local.merged_spaces : key => value if value.exists == false
  }
}

data "spacelift_space" "this" {
  for_each = local.spaces_exists
  space_id = each.value.id
}


resource "spacelift_space" "this" {
  for_each         = local.spaces
  name             = each.key
  parent_space_id  = each.value.parent_space_id
  description      = try(each.value.description, "This a child of the ${each.value.parent_space_id} space.")
  inherit_entities = each.value.inherit_entities
}
