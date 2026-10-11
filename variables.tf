variable "redshift_parameter_groups" {
  description = <<EOT
Map of redshift_parameter_groups, attributes below
Required:
    - family
    - name
Optional:
    - description
    - region
    - tags
    - tags_all
    - parameter (block):
        - name (required)
        - value (required)
EOT

  type = map(object({
    family      = string
    name        = string
    description = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
    parameter = optional(list(object({
      name  = string
      value = string
    })))
  }))
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

