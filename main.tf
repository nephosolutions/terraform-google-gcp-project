# Copyright 2020 NephoSolutions SRL, Sebastian Trebitz
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

resource "random_id" "project" {
  byte_length = 4
}

resource "random_pet" "name" {
}

resource "google_project" "project" {
  name = var.project_name

  project_id      = join("-", [random_pet.name.id, random_id.project.hex])
  org_id          = var.folder_id == "" ? var.org_id : null
  folder_id       = var.folder_id != "" ? var.folder_id : null
  billing_account = var.billing_account
  skip_delete     = var.skip_delete

  auto_create_network = var.auto_create_network
}

resource "google_project_iam_binding" "authoritative" {
  for_each = var.iam_bindings
  project  = google_project.project.project_id
  role     = each.key
  members  = distinct(compact(each.value))
}

locals {
  project_services = distinct(
    concat(
      [
        "cloudbilling.googleapis.com",
        "cloudresourcemanager.googleapis.com",
        "compute.googleapis.com",
        "iam.googleapis.com",
        "serviceusage.googleapis.com",
      ],
      var.project_services
    )
  )
}

module "project_services" {
  source = "./modules/project_services"

  project_id       = google_project.project.project_id
  project_services = local.project_services

  disable_on_destroy         = true
  disable_dependent_services = true
}

module "metadata" {
  source = "./modules/metadata"

  project_id = google_project.project.project_id

  metadata = {
    "enable-osconfig" = contains(local.project_services, "osconfig.googleapis.com") && var.enable_osconfig ? "TRUE" : "FALSE"
    "enable-oslogin"  = contains(local.project_services, "oslogin.googleapis.com") && var.enable_oslogin ? "TRUE" : "FALSE"

    "google-compute-default-region" = var.default_region
    "google-compute-default-zone"   = var.default_zone

    "ssh-keys" = module.metadata_ssh_keys.mapping
  }
}

module "metadata_ssh_keys" {
  source = "./modules/metadata_ssh_keys"

  ssh_users = var.ssh_users
}
