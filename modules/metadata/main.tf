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

module "metadata_ssh_keys" {
  source = "./modules/metadata_ssh_keys"

  ssh_users = var.ssh_users
}

resource "google_compute_project_metadata_item" "disable_legacy_endpoints" {
  project = var.project_id

  key   = "disable-legacy-endpoints"
  value = "TRUE"
}

resource "google_compute_project_metadata_item" "enable_guest_attributes" {
  count   = var.enable_guest_attributes ? 1 : 0
  project = var.project_id

  key   = "enable-guest-attributes"
  value = "TRUE"
}

resource "google_compute_project_metadata_item" "enable_os_inventory" {
  count   = var.enable_os_inventory ? 1 : 0
  project = var.project_id

  key   = "enable-os-inventory"
  value = "TRUE"
}

resource "google_compute_project_metadata_item" "enable_osconfig" {
  count   = var.enable_os_config ? 1 : 0
  project = var.project_id

  key   = "enable-osconfig"
  value = "TRUE"
}

resource "google_compute_project_metadata_item" "enable_oslogin" {
  count   = var.enable_os_login ? 1 : 0
  project = var.project_id

  key   = "enable-oslogin"
  value = "TRUE"
}

resource "google_compute_project_metadata_item" "enable_oslogin_2fa" {
  count   = var.enable_os_login_2fa ? 1 : 0
  project = var.project_id

  key   = "enable-oslogin-2fa"
  value = "TRUE"
}

resource "google_compute_project_metadata_item" "google_compute_default_region" {
  project = var.project_id

  key   = "google-compute-default-region"
  value = var.google_compute_default_region
}

resource "google_compute_project_metadata_item" "google_compute_default_zone" {
  project = var.project_id

  key   = "google-compute-default-zone"
  value = var.google_compute_default_zone
}

resource "google_compute_project_metadata_item" "ssh_keys" {
  project = var.project_id

  key   = "ssh-keys"
  value = module.metadata_ssh_keys.mapping
}

resource "google_compute_project_metadata_item" "vm_dns_setting" {
  project = var.project_id

  key   = "vmdnssetting"
  value = var.vm_dns_setting
}
