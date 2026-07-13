variable "lighthouse_assignments" {
  description = <<EOT
Map of lighthouse_assignments, attributes below
Required:
    - lighthouse_definition_id
    - scope
Optional:
    - name
EOT

  type = map(object({
    lighthouse_definition_id = string
    scope                    = string
    name                     = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.lighthouse_assignments : (
        v.name == null || (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.name)))
      )
    ])
    error_message = "must be a valid UUID"
  }
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

