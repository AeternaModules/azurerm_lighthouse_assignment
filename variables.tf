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
  # --- Unconfirmed validation candidates, derived from azurerm_lighthouse_assignment's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: lighthouse_definition_id
  #   source:    [from registrationdefinitions.ValidateScopedRegistrationDefinitionID] !ok
  # path: lighthouse_definition_id
  #   source:    [from registrationdefinitions.ValidateScopedRegistrationDefinitionID] err != nil
  # path: scope
  #   source:    validation.Any(...) - no translation rule yet, add one
}

