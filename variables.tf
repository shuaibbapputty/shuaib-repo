variable "environment" {
  description = "Logical name of the environment this workspace represents (e.g. dev, staging, prod)."
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Name of the project, used as a prefix for generated resource names."
  type        = string
  default     = "shuaib-repo"
}
