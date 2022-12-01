## SKIP LICENSE INSERTION

# Copyright 2018-2020, 2022 NephoSolutions srl, Sebastian Trebitz
# Copyright 2022 Google LLC
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

locals {
  activate_compute_identity = contains(local.project_service_identity_apis, "compute.googleapis.com")
  project_service_identities = flatten([for i in var.project_service_identities : [for r in i["roles"] : {
    api  = i["api"],
    role = r
  }]])
  project_service_identity_apis = [for service_identity in var.project_service_identities : service_identity["api"]]
  project_services              = toset(concat(var.project_services, local.project_service_identity_apis))
}

resource "google_project_service" "project_service" {
  for_each = local.project_services

  project = var.project_id
  service = each.value

  disable_on_destroy         = var.disable_on_destroy
  disable_dependent_services = var.disable_dependent_services
}

data "google_compute_default_service_account" "default" {
  count   = local.activate_compute_identity ? 1 : 0
  project = var.project_id
}

resource "google_project_service_identity" "project_service_identities" {
  for_each = setsubtract(local.project_service_identity_apis, ["compute.googleapis.com"])

  provider = google-beta
  project  = var.project_id
  service  = each.value
}

locals {
  project_service_identity_roles = merge(
    {
      for si in local.project_service_identities :
      "${si["api"]} ${si["role"]}" => {
        email = google_project_service_identity.project_service_identities[si["api"]].email
        role  = si["role"]
      }
      if si["api"] != "compute.googleapis.com"
    },
    {
      for si in local.project_service_identities :
      "${si["api"]} ${si["role"]}" => {
        email = data.google_compute_default_service_account.default[0].email
        role  = si["role"]
      }
      if si["api"] == "compute.googleapis.com"
    }
  )
}

resource "google_project_iam_member" "project_service_identity_roles" {
  for_each = local.project_service_identity_roles

  project = var.project_id
  role    = each.value["role"]
  member  = "serviceAccount:${each.value["email"]}"
}
