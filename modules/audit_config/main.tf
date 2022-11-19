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

resource "google_project_iam_audit_config" "project" {
  project = var.project_id
  service = var.service

  dynamic "audit_log_config" {
    for_each = var.audit_log_config

    content {
      log_type         = audit_log_config.key
      exempted_members = audit_log_config.value["exempted_members"]
    }
  }
}
