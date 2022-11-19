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

variable "google_compute_default_region" {
  description = "The region used by default to create new resources"
  type        = string
}

variable "google_compute_default_zone" {
  description = "The zone within a region used by default to create new resources"
  type        = string
}

variable "project_id" {
  description = "The Google project ID for which you want to enable APIs"
  type        = string
}
variable "ssh_users" {
  description = "A map of user:ssk_key pairs"
  type        = map(string)
  default     = {}
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
