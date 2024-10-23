package spacelift

deny_list := ["t3.large", "t3.xlarge", "t3.2xlarge", "e608b55a"]

allow_list := ["t3.micro", "t3.small", "t3.medium"]

deny[sprintf(message, [resource.address, instance])] {
	message := "Instance type %s is not allowed (%s)"
	resource := input.terraform.resource_changes[_]
	resource.type == "aws_instance"
	instance := resource.change.after.instance_type
	is_in_deny_list(instance)
}

warn[sprintf(message, [resource.address, instance])] {
	message := "Instance type %s is not recommended (%s)"
	resource := input.terraform.resource_changes[_]
	resource.type == "aws_instance"
	instance := resource.change.after.instance_type
	not is_in_allow_list(instance)
	not is_in_deny_list(instance)
}

is_in_allow_list(instance) {
	some allowed_instance
	allowed_instance = allow_list[_]
	allowed_instance == instance
}

is_in_deny_list(instance) {
	some denied_instance
	denied_instance = deny_list[_]
	denied_instance == instance
}


sample := true
