# Minimal, self-contained configuration used to validate that a VCS-driven
# Terraform workspace (for example, one connected through Firefly) can
# successfully init/plan/apply against this repository.
#
# It intentionally avoids any real cloud provider credentials so the
# workspace can be exercised end-to-end without extra setup.

resource "random_pet" "workspace" {
  length    = 2
  separator = "-"
  prefix    = var.project_name
}

resource "local_file" "workspace_marker" {
  filename = "${path.module}/workspace-info.txt"
  content  = <<-EOT
    project     = ${var.project_name}
    environment = ${var.environment}
    name        = ${random_pet.workspace.id}
  EOT
}
