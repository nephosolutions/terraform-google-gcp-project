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

variable "disable_on_destroy" {
  description = "Disable the service when the terraform resource is destroyed."
  type        = bool
  default     = true
}

variable "disable_dependent_services" {
  description = "If `true`, services that are enabled and which depend on this service should also be disabled when this service is destroyed. If `false`, an error will be generated if any enabled services depend on this service when destroying it."
  type        = bool
  default     = true
}

variable "project_id" {
  description = "The Google project ID for which you want to enable APIs"
  type        = string
}

variable "project_services" {
  description = "A list of Google APIs to activate on this project"
  type        = list(string)
}
