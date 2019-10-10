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

resource "random_pet" "prefix" {
}

resource "random_id" "google_project_id" {
  byte_length = 4
  prefix      = "${random_pet.prefix.id}-"
}

resource "google_project" "project" {
  name = var.project_name

  project_id      = lower(random_id.google_project_id.hex)
  org_id          = var.folder_id == "" ? var.org_id : null
  folder_id       = var.folder_id != "" ? var.folder_id : null
  billing_account = var.billing_account
  skip_delete     = var.skip_delete

  auto_create_network = var.auto_create_network
}

data "google_project_services" "enabled" {
  project = google_project.project.project_id
}

locals {
  required_api_services = [
    "cloudbilling.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "serviceusage.googleapis.com",
  ]
  seletced_api_services = distinct(
    concat(
      sort(local.required_api_services),
      sort(var.api_services),
      sort(data.google_project_services.enabled.services),
    ),
  )
}

resource "google_project_iam_binding" "authoritative" {
  for_each = var.iam_bindings
  project  = google_project.project.project_id
  role     = each.key
  members  = distinct(compact(each.value))
}

resource "google_project_services" "enabled" {
  project  = google_project.project.project_id
  services = local.seletced_api_services

  disable_on_destroy = false
}

resource "google_compute_project_metadata_item" "default_region" {
  count      = var.default_region == "" ? 0 : 1
  depends_on = [google_project_services.enabled]

  project = google_project.project.project_id
  key     = "google-compute-default-region"
  value   = var.default_region
}

resource "google_compute_project_metadata_item" "default_zone" {
  count      = var.default_zone == "" ? 0 : 1
  depends_on = [google_project_services.enabled]

  project = google_project.project.project_id
  key     = "google-compute-default-zone"
  value   = var.default_zone
}

module "metadata_ssh_keys" {
  source = "./modules/metadata-ssh-keys"

  ssh_users = var.ssh_users
}

resource "google_compute_project_metadata_item" "enable_oslogin" {
  depends_on = [google_project_services.enabled]

  project = google_project.project.project_id
  key     = "enable-oslogin"
  value   = contains(local.seletced_api_services, "oslogin.googleapis.com") && var.enable_oslogin ? "TRUE" : "FALSE"
}

resource "google_compute_project_metadata_item" "ssh_keys" {
  count      = length(keys(var.ssh_users))
  depends_on = [google_project_services.enabled]

  project = google_project.project.project_id
  key     = "ssh-keys"
  value   = module.metadata_ssh_keys.mapping
}
