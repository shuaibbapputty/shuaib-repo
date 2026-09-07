# shuaib-repo

A minimal Terraform repository used to manage Terraform infrastructure and to
test VCS-driven workspaces in the [Firefly](https://www.firefly.ai/) cloud
management application.

## Purpose

This repo intentionally contains a very small, self-contained Terraform
configuration (no cloud provider credentials required) so it can be used to
validate that a VCS integration and its associated Terraform workspace work
end-to-end:

- `versions.tf` — Terraform and provider version constraints
  (`hashicorp/random` and `hashicorp/local`).
- `variables.tf` — input variables (`environment`, `project_name`).
- `main.tf` — creates a `random_pet` name and writes a small `local_file` with
  workspace metadata.
- `outputs.tf` — exposes the generated workspace name and environment.

Because it only uses the `random` and `local` providers, `terraform init`,
`plan`, and `apply` all work without any external cloud account, which makes
it ideal for smoke-testing a new VCS-backed workspace.

## Using this repo with Firefly (or another VCS-driven Terraform workspace)

1. Create a new VCS integration in Firefly (or your Terraform workspace
   provider of choice) and connect it to this repository.
2. Create a new Terraform workspace that points at this repository, using the
   repository root as the working directory.
3. Trigger a plan/apply run. It should succeed without needing any
   credentials, since the configuration only uses local providers.
4. Optionally override the default variables (`environment`,
   `project_name`) from the workspace configuration to confirm variable
   overrides are wired up correctly.

## Local usage

```bash
terraform init
terraform plan
terraform apply
```
