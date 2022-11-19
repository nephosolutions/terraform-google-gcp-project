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

variable "billing_account" {
  description = "the billing_account to which the project should be attached to"
  type        = string
}

variable "org_id" {
  description = "The numeric ID of the organization this project belongs to."
  type        = string
}

variable "project_id" {
  description = "The project ID of the Google billing project for this test"
  type        = string
}
