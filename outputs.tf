output "workspace_name" {
  description = "Generated name that uniquely identifies this workspace run."
  value       = random_pet.workspace.id
}

output "environment" {
  description = "Environment associated with this workspace run."
  value       = var.environment
}
