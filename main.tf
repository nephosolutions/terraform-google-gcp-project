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

data "google_app_engine_default_service_account" "project" {
  project = module.project.project_id
}

data "google_compute_default_service_account" "project" {
  project = module.project.project_id
}

module "audit_config" {
  source   = "./modules/audit_config"
  for_each = var.iam_audit_config

  project_id       = module.project.project_id
  service          = each.key
  audit_log_config = each.value
}

locals {
  // Google-managed service account used to access the APIs of Google Cloud Platform services.
  google_api_service_agent = "${module.project.number}@cloudservices.gserviceaccount.com"
}

/* There are several basic roles that existed prior to the introduction of IAM:
    Owner, Editor, and Viewer. These roles are concentric; that is, the Owner role includes the permissions in the Editor role,
    and the Editor role includes the permissions in the Viewer role. They were originally known as "primitive roles."

   Caution:
    Basic roles include thousands of permissions across all Google Cloud services.
    In production environments, do not grant basic roles unless there is no alternative.
    Instead, grant the most limited predefined roles or custom roles that meet your needs. */
module "iam_bindings" {
  source = "./modules/iam_bindings"

  project_id = module.project.project_id

  // All viewer permissions, plus permissions for actions that modify state, such as changing existing resources.
  editors = compact([
    contains(local.project_services, "appengine.googleapis.com") ? "serviceAccount:${data.google_app_engine_default_service_account.project.email}" : "",
    contains(local.project_services, "compute.googleapis.com") ? "serviceAccount:${data.google_compute_default_service_account.project.email}" : "",
    contains(local.project_services, "compute.googleapis.com") ? "serviceAccount:${local.google_api_service_agent}" : "",
  ])

  /* All editor permissions and permissions for the following actions:
          - Manage roles and permissions for a project and all resources within the project.
          - Set up billing for a project. */
  owners = []

  /* Permissions for read-only actions that do not affect state,
      such as viewing (but not modifying) existing resources or data. */
  viewers = []
}

module "iam_memberships" {
  source   = "./modules/iam_memberships"
  for_each = var.iam_memberships

  project_id = module.project.project_id
  role       = each.key
  members    = each.value
}

locals {
  default_region = join("-", slice(split("-", var.default_zone), 0, 2))
}

module "metadata" {
  source     = "./modules/metadata"
  depends_on = [module.project_services]

  project_id = module.project.project_id

  enable_guest_attributes = var.enable_guest_attributes
  enable_os_inventory     = var.enable_os_inventory
  enable_os_config        = var.enable_os_config
  enable_os_login         = var.enable_os_login
  enable_os_login_2fa     = var.enable_os_login_2fa

  google_compute_default_region = local.default_region
  google_compute_default_zone   = var.default_zone

  ssh_users      = var.ssh_users
  vm_dns_setting = var.vm_dns_setting
}

locals {
  project_labels = merge({ managed-by = "terraform" }, var.labels)
}

module "project" {
  source = "./modules/project"

  auto_create_network = var.auto_create_network
  billing_account     = var.billing_account
  folder_id           = var.folder_id
  org_id              = var.org_id
  project_labels      = local.project_labels
  project_name        = var.project_name
  skip_delete         = var.skip_delete
}

locals {
  project_services = distinct(concat(
    local.required_project_services.default,
    var.enable_guest_attributes ? local.required_project_services.guest_attributes : [],
    var.enable_os_config ? local.required_project_services.os_config : [],
    var.enable_os_inventory ? local.required_project_services.os_inventory : [],
    var.enable_os_login ? local.required_project_services.os_login : [],
    var.project_services
  ))

  required_project_services = {
    /* Set of Google APIs which must be enabled on each project in order to set it up with this Terraform module. */
    default = [
      "cloudbilling.googleapis.com",
      "cloudresourcemanager.googleapis.com",
      "compute.googleapis.com",
      "iam.googleapis.com",
      "serviceusage.googleapis.com",
    ]

    guest_attributes = [
      "containeranalysis.googleapis.com",
    ]

    os_config = [
      "containeranalysis.googleapis.com",
      "osconfig.googleapis.com",
    ]

    os_inventory = [
      "containeranalysis.googleapis.com",
    ]

    os_login = [
      "oslogin.googleapis.com",
    ]
  }
}

module "project_services" {
  source = "./modules/project_services"

  project_id       = module.project.project_id
  project_services = local.project_services

  disable_on_destroy         = var.disable_project_services_on_destroy
  disable_dependent_services = var.disable_dependent_project_services
}
