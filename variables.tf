#   Copyright 2019 NephoSolutions SPRL, Sebastian Trebitz
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

locals {
  required_api_services = [
    "serviceusage.googleapis.com",
  ]
  seletced_api_services = "${distinct(concat(local.required_api_services, var.api_services))}"
}

variable "api_services" {
  description = "list of Google APIs to activate on this project"
  default     = []
  type        = "list"
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

variable "organisation_id" {
  description = "the id of the organisation in which the project should be created"
}

variable "project_name" {
  description = "the name of the project"
}

variable "ssh_users" {
  description = "a map of user:ssk_key pairs"
  default     = {}
  type        = "map"
}
