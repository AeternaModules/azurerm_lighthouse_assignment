output "lighthouse_assignments_id" {
  description = "Map of id values across all lighthouse_assignments, keyed the same as var.lighthouse_assignments"
  value       = { for k, v in azurerm_lighthouse_assignment.lighthouse_assignments : k => v.id }
}
output "lighthouse_assignments_lighthouse_definition_id" {
  description = "Map of lighthouse_definition_id values across all lighthouse_assignments, keyed the same as var.lighthouse_assignments"
  value       = { for k, v in azurerm_lighthouse_assignment.lighthouse_assignments : k => v.lighthouse_definition_id }
}
output "lighthouse_assignments_name" {
  description = "Map of name values across all lighthouse_assignments, keyed the same as var.lighthouse_assignments"
  value       = { for k, v in azurerm_lighthouse_assignment.lighthouse_assignments : k => v.name }
}
output "lighthouse_assignments_scope" {
  description = "Map of scope values across all lighthouse_assignments, keyed the same as var.lighthouse_assignments"
  value       = { for k, v in azurerm_lighthouse_assignment.lighthouse_assignments : k => v.scope }
}

