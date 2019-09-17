# Changelog

All notable changes to this project will be documented in this file.

## [Unreleased]

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

[Unreleased]: https://github.com/nephosolutions/terraform-google-gcp-project/compare/v4.0.0...HEAD
[4.0.0]: https://github.com/nephosolutions/terraform-google-gcp-project/compare/v3.0.0...v4.0.0
[3.0.0]: https://github.com/nephosolutions/terraform-google-gcp-project/compare/v2.0.0...v3.0.0
[2.0.0]: https://github.com/nephosolutions/terraform-google-gcp-project/compare/v1.1.0...v2.0.0
[1.1.0]: https://github.com/nephosolutions/terraform-google-gcp-project/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/nephosolutions/terraform-google-gcp-project/compare/v0.2.1...v1.0.0
[0.2.1]: https://github.com/nephosolutions/terraform-google-gcp-project/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/nephosolutions/terraform-google-gcp-project/compare/v0.1.8...v0.2.0
[0.1.8]: https://github.com/nephosolutions/terraform-google-gcp-project/compare/v0.1.7...v0.1.8
[0.1.7]: https://github.com/nephosolutions/terraform-google-gcp-project/compare/v0.1.6...v0.1.7
[0.1.6]: https://github.com/nephosolutions/terraform-google-gcp-project/compare/v0.1.5...v0.1.6
[0.1.5]: https://github.com/nephosolutions/terraform-google-gcp-project/compare/v0.1.4...v0.1.5
[0.1.4]: https://github.com/nephosolutions/terraform-google-gcp-project/compare/v0.1.3...v0.1.4
[0.1.3]: https://github.com/nephosolutions/terraform-google-gcp-project/compare/v0.1.2...v0.1.3
[0.1.2]: https://github.com/nephosolutions/terraform-google-gcp-project/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/nephosolutions/terraform-google-gcp-project/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/nephosolutions/terraform-google-gcp-project/releases/tag/v0.1.0
