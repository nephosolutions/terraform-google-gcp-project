# Copyright 2019 NephoSolutions SPRL, Sebastian Trebitz
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

variable "api_services" {
  description = "list of Google APIs to activate on this project"
  default     = []
  type        = list(string)
}

variable "auto_create_network" {
  description = "Create the 'default' network automatically."
  default     = true
}

variable "billing_account" {
  description = "the billing_account to which the project should be attached to"
}

variable "default_region" {
  description = "The region used by default to create new resources"
  default     = ""
}

variable "default_zone" {
  description = "The zone within a region used by default to create new resources"
  default     = ""
}

variable "enable_oslogin" {
  description = "Use Cloud OS Login API to manage OS login configuration for Google account users"
  default     = false
}

variable "folder_id" {
  description = "The numeric ID of the folder this project should be created under."
  default     = ""
}

variable "iam_bindings" {
  description = "Updates the IAM policy to grant a role to a list of members. Authoritative for a given role. Other roles within the IAM policy for the project are preserved."
  default     = {}
  type        = map(list(string))
}

variable "org_id" {
  description = "The numeric ID of the organization this project belongs to."
}

variable "project_name" {
  description = "the name of the project"
}

variable "ssh_users" {
  description = "a map of user:ssk_key pairs"
  default     = {}
  type        = map(string)
}

variable "skip_delete" {
  description = "If true, the Terraform resource can be deleted without deleting the Project via the Google API."
  default     = false
}
