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

variable "folder_id" {
  description = "The numeric ID of the folder this project should be created under."
  type        = string
  default     = null
}

variable "org_id" {
  description = "The numeric ID of the organization this project belongs to."
  type        = string
}

variable "project_labels" {
  description = "Map of key vale pairs to set as project labels"
  type        = map(string)
}

variable "project_name" {
  description = "the name of the project"
  type        = string

  validation {
    condition     = can(regex("^[:alnum:][[:alnum:]-_\\s]+[:alnum:]$", var.project_name))
    error_message = "The display name must start and end with a letter or digit, may contain letters, digits, spaces, hyphens and underscores."
  }

  validation {
    condition     = length(var.project_name) < 30
    error_message = "The display name can be no longer than 30 characters."
  }
}

variable "skip_delete" {
  description = "If true, the Terraform resource can be deleted without deleting the Project via the Google API."
  type        = bool
  default     = false
}
