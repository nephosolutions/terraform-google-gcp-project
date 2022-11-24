# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

## [6.0.2] - 2022-11-24

- Fix `project_name` variable validation rules

## [6.0.0] - 2022-11-19

Major code refactoring release; please check impact on deployed resources carefully when upgrading from a previous
version.

- Split project resources into submodule
- Split `google_project` resource into two different ones, one for projects attached to the org, another for project in
  folders
- Add support for IAM audit configuration policies
- Add support for IAM binding for basic IAM roles
- Add support for IAM memberships for predefined or custom roles
- Refactor GCP project metadata submodule to configure individual metadata items

## [5.1.1] - 2020-09-05

- Configure remaining OS Config service matadata keys

## [5.1.0] - 2020-09-05

- Manage the Google OS Config service

## [5.0.0] - 2020-05-31

- Split into submodules
- Refactor management of GCP project services

## [4.1.1] - 2019-10-10

- Bug fix: deduplicate and remove empty list items from `iam_bindings[each.value]`

## [4.1.0] - 2019-09-21

- Add the ability to define authoritative IAM bindings

## [4.0.1] - 2019-09-20

- Enable `cloudbilling.googleapis.com` by default - required to attach a billing account

## [4.0.0] - 2019-09-17

- Enable additionally required service APIs and depend on them
- Implement missing google_project attributes

## [3.0.0] - 2019-07-15

- Supported version of Terraform is 0.12

## [2.0.0] - 2019-06-28

- Partially revert manage GCP project service APIs as individual resources
- Add a possibility to enable OS login configuration for Google account users on project level

__Attention:__ If you upgrade from version:

- 1.x.y you have to clean your Terraform state manually
- 0.x.y you should be good to go

```sh
terraform state rm module.gcp_project.google_project_service.selected
```

## [1.1.0] - 2019-06-14

- Add SSH key management for project metadata; the metadata-ssh-keys submodule can be used independently -  e.g. manage ssh-key metadata on instance level

## [1.0.0] - 2019-06-13

- Added a list of project service APIs which will be enabled by default for resource types managed within this module
- The GCP project service APIs to enable are now managed as individual resources

__Attention:__ If you upgrade from version 0.x.y you have to clean your Terraform state manually

```sh
terraform state rm module.gcp_project.google_project_services.project
```

[Unreleased]: https://github.com/nephosolutions/terraform-google-gcp-project/compare/v6.0.2...HEAD
[6.0.2]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v6.0.2
[6.0.0]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v6.0.0
[5.1.1]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v5.1.1
[5.1.0]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v5.1.0
[5.0.0]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v5.0.0
[4.1.1]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v4.1.1
[4.1.0]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v4.1.0
[4.0.1]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v4.0.1
[4.0.0]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v4.0.0
[3.0.0]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v3.0.0
[2.0.0]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v2.0.0
[1.1.0]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v1.1.0
[1.0.0]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v1.0.0
[0.2.1]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v0.2.1
[0.2.0]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v0.2.0
[0.1.8]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v0.1.8
[0.1.7]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v0.1.7
[0.1.6]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v0.1.6
[0.1.5]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v0.1.5
[0.1.4]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v0.1.4
[0.1.3]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v0.1.3
[0.1.2]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v0.1.2
[0.1.1]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v0.1.1
[0.1.0]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v0.1.0
