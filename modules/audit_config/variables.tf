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

variable "audit_log_config" {
  description = "Map of audit log types for which logging is to be configured, with an map of optional attributes including a list of identities that do not cause logging. [google_folder_iam_audit_config](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_folder_iam#google_folder_iam_audit_config)"

  type = map(object({
    exempted_members = list(string)
  }))
}

variable "project_id" {
  description = "The Google project ID for which you want to enable APIs"
  type        = string
}

variable "service" {
  description = "Service which will be enabled for audit logging. The special value `allServices` covers all services. Note that if there are `google_project_iam_audit_config` resources covering both `allServices` and a specific service then the union of the two AuditConfigs is used for that service: the `log_types` specified in each `audit_log_config` are enabled, and the `exempted_members` in each `audit_log_config` are exempted."
  type        = string
}
