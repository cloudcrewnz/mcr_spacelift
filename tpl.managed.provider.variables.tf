variable "azuredevops_personal_token" {
  description = "Azure DevOps Personal Access Token for SVC Terraform"
  type        = string
  sensitive   = true
  default     = null
}

variable "spacelift_key_id" {
  description = "Spacelift Key_ID"
  type        = string
  sensitive   = true
}
variable "spacelift_key_secret" {
  description = "Spacelift Secret"
  type        = string
  sensitive   = true
  default     = null
}
