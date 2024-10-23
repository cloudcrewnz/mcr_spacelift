locals {
  flattened_policies = flatten([
    for space_key, space_value in local.merged_spaces : [
      for policy_key, policy_value in try(space_value.policies, []) : {
        space_id    = space_value.id
        policy_id   = policy_key
        name        = policy_key
        policy      = policy_value.policy
        description = policy_value.description
        type        = policy_value.type
      }
    ]
  ])
}

resource "spacelift_policy" "this" {
  for_each    = { for policy in local.flattened_policies : policy.policy_id => policy }
  name        = each.key
  space_id    = each.value.space_id
  description = each.value.description
  type        = each.value.type
  body        = file("${path.module}/${each.value.policy}")
}
