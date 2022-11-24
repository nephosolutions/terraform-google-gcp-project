# Copyright 2018-2020, 2022 NephoSolutions srl, Sebastian Trebitz
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

variable "auto_create_network" {
  description = "Create the 'default' network automatically."
  type        = bool
  default     = false
}

variable "billing_account" {
  description = "the billing_account to which the project should be attached to"
  type        = string
}

variable "default_region" {
  description = "The region used by default to create new resources"
  type        = string
}

variable "default_zone" {
  description = "The zone within a region used by default to create new resources"
  type        = string
}

variable "disable_project_services_on_destroy" {
  description = "Disable the service when the terraform resource is destroyed."
  type        = bool
  default     = true
}

variable "disable_dependent_project_services" {
  description = "If `true`, services that are enabled and which depend on this service should also be disabled when this service is destroyed. If `false`, an error will be generated if any enabled services depend on this service when destroying it."
  type        = bool
  default     = true
}

variable "enable_guest_attributes" {
  description = "Enable setting [guest attributes](https://cloud.google.com/compute/docs/metadata/manage-guest-attributes) for the project."
  type        = bool
  default     = false
}

variable "enable_os_inventory" {
  description = "Enables or disables [OS inventory](https://cloud.google.com/compute/docs/instances/view-os-details) for the project."
  type        = bool
  default     = false
}

variable "enable_os_config" {
  description = ""
  type        = bool
  default     = false
}

variable "enable_os_login" {
  description = "Enables or disables SSH key management on the project."
  type        = bool
  default     = false
}

variable "enable_os_login_2fa" {
  description = "Enable 2-step verification for OS Login."
  type        = bool
  default     = false
}

variable "folder_id" {
  description = "The numeric ID of the folder this project should be created under."
  type        = string
  default     = null
}

variable "iam_audit_config" {
  default     = {}
  description = "Map of service APIs which will be enabled for audit logging, with a map of audit log types for which logging is to be configured, with an map of optional attributes including a list of identities that do not cause logging. [google_folder_iam_audit_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_folder_iam#google_folder_iam_audit_config)"

  type = map(map(object({
    exempted_members = list(string)
  })))
}

variable "iam_memberships" {
  description = "Updates the IAM policy to grant a role to a list of members."
  type        = map(list(string))
  default     = {}
}

variable "labels" {
  description = "Map of key vale pairs to set as project labels"
  type        = map(string)
}

variable "org_id" {
  description = "The numeric ID of the organization this project belongs to."
  type        = string
}

variable "project_name" {
  description = "the name of the project"
  type        = string

  validation {
    condition     = can(regex("^[[:alnum:]][0-9A-Za-z-_\\s]+[[:alnum:]]$", var.project_name))
    error_message = "The display name must start and end with a letter or digit, may contain letters, digits, spaces, hyphens and underscores."
  }

  validation {
    condition     = length(var.project_name) <= 30
    error_message = "The display name can be no longer than 30 characters."
  }
}

variable "project_services" {
  description = "A list of Google APIs to activate on this project"
  type        = list(string)
  default     = []
}

variable "ssh_users" {
  description = "A map of user:ssk_key pairs"
  type        = map(string)
  default     = {}
}

variable "skip_delete" {
  description = "If true, the Terraform resource can be deleted without deleting the Project via the Google API."
  type        = bool
  default     = false
}

variable "vm_dns_setting" {
  description = "Enable zonal DNS and global DNS for the VMs in your project."
  type        = string
  default     = "ZonalOnly"

  validation {
    condition     = contains(["GlobalDefault", "ZonalOnly"], var.vm_dns_setting)
    error_message = "The value can either be 'ZonalOnly' (recommended) or 'GlobalDefault'; see https://cloud.google.com/compute/docs/internal-dns#setting-zonal-dns"
  }
}
