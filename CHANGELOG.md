# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.0] - 2019-06-13

### Added

- A list of project service APIs which will be enabled by default for resource types managed within this module

### Changed

- The GCP project service APIs to enable are now managed as individual resources.

__Attention:__ If you upgrade from version 0.x.y you have to clean your Terraform state manually

```sh
terraform state rm module.gcp_project.google_project_services.project
```

[Unreleased]: https://github.com/nephosolutions/terraform-google-gcp-project/compare/v1.0.0...HEAD
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
