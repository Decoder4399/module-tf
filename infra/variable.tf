variable "bucket_name" {
  description = "infra bucket name"
  type = string
}

variable "env" {
  description = "infra environment name"
  type = string
}

variable "instance_count" {
  description = "infra instance count"
  type = number
}

variable "instance_type" {
  description = "infra instance type"
  type = string
}

variable "hash_key" {
  description = "infra hash key"
  type = string
}