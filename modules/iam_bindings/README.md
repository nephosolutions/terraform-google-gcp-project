# Google Compute Engine metadata Terraform module

This Terraform module configures authoritatively the IAM policy for basic roles on the given project.
Any existing policy will be replaced by this module.

There are several basic roles that existed prior to the introduction of IAM:
Owner, Editor, and Viewer. These roles are concentric; that is, the Owner role includes the permissions in the Editor role,
and the Editor role includes the permissions in the Viewer role. They were originally known as "primitive roles."

Caution:
  Basic roles include thousands of permissions across all Google Cloud services.
  In production environments, do not grant basic roles unless there is no alternative.
  Instead, grant the most limited predefined roles or custom roles that meet your needs.


## Usage

```hcl
module "metadata" {
  source  = "nephosolutions/gcp-project/google//modules/iam_bindings"
  version = "~> 6.0.0"

  project_id = "my-project-id"

  // All viewer permissions, plus permissions for actions that modify state, such as changing existing resources.
  editors = []

  /* All editor permissions and permissions for the following actions:
          - Manage roles and permissions for a project and all resources within the project.
          - Set up billing for a project. */
  owners  = []

  /* Permissions for read-only actions that do not affect state,
      such as viewing (but not modifying) existing resources or data. */
  viewers = []
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.6 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.90 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.43.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_project_iam_binding.basic_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_binding) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_editors"></a> [editors](#input\_editors) | Identities that will be granted the basic role `editor` on the project | `list(string)` | n/a | yes |
| <a name="input_owners"></a> [owners](#input\_owners) | Identities that will be granted the basic role `owner` on the project | `list(string)` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The Google project ID for which you want to enable APIs | `string` | n/a | yes |
| <a name="input_viewers"></a> [viewers](#input\_viewers) | Identities that will be granted the basic role `viewer` on the project | `list(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
