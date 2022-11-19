# Google Compute Engine metadata Terraform module

This Terraform module configures authoritatively the IAM audit config policy for the given project. Any existing policy
will be replaced by this module.

## Usage

```hcl
module "audit_config" {
  source  = "nephosolutions/gcp-project/google//modules/audit_config"
  version = "~> 6.0.0"

  project_id = "my-project-id"
  service    = "allServices"

  audit_log_config = {
    ADMIN_READ = {
      exempted_members = []
    }

    DATA_READ = {
      exempted_members = []
    }

    DATA_WRITE = {
      exempted_members = []
    }
  }
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
| [google_project_iam_audit_config.project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_audit_config) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_audit_log_config"></a> [audit\_log\_config](#input\_audit\_log\_config) | Map of audit log types for which logging is to be configured, with an map of optional attributes including a list of identities that do not cause logging. [google\_folder\_iam\_audit\_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_folder_iam#google_folder_iam_audit_config) | <pre>map(object({<br>    exempted_members = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The Google project ID for which you want to enable APIs | `string` | n/a | yes |
| <a name="input_service"></a> [service](#input\_service) | Service which will be enabled for audit logging. The special value `allServices` covers all services. Note that if there are `google_project_iam_audit_config` resources covering both `allServices` and a specific service then the union of the two AuditConfigs is used for that service: the `log_types` specified in each `audit_log_config` are enabled, and the `exempted_members` in each `audit_log_config` are exempted. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
