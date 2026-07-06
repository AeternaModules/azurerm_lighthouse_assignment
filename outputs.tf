output "lighthouse_assignments" {
  description = "All lighthouse_assignment resources"
  value       = azurerm_lighthouse_assignment.lighthouse_assignments
}
output "lighthouse_assignments_lighthouse_definition_id" {
  description = "List of lighthouse_definition_id values across all lighthouse_assignments"
  value       = [for k, v in azurerm_lighthouse_assignment.lighthouse_assignments : v.lighthouse_definition_id]
}
output "lighthouse_assignments_name" {
  description = "List of name values across all lighthouse_assignments"
  value       = [for k, v in azurerm_lighthouse_assignment.lighthouse_assignments : v.name]
}
output "lighthouse_assignments_scope" {
  description = "List of scope values across all lighthouse_assignments"
  value       = [for k, v in azurerm_lighthouse_assignment.lighthouse_assignments : v.scope]
}

