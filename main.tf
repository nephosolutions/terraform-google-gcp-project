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

resource "random_pet" "prefix" {}

resource "random_id" "google_project_id" {
  byte_length = 4
  prefix      = "${random_pet.prefix.id}-"
}

resource "google_project" "project" {
  name            = "${var.project_name}"
  project_id      = "${lower(random_id.google_project_id.hex)}"
  billing_account = "${var.billing_account}"
  org_id          = "${var.organisation_id}"
}

resource "google_project_service" "selected" {
  count = "${length(local.seletced_api_services)}"

  project = "${google_project.project.project_id}"
  service = "${element(local.seletced_api_services, count.index)}"

  disable_dependent_services = true
}

resource "google_compute_project_metadata_item" "default_region" {
  count = "${var.default_region == "" ? 0 : 1}"

  project = "${google_project.project.project_id}"
  key     = "google-compute-default-region"
  value   = "${var.default_region}"
}

resource "google_compute_project_metadata_item" "default_zone" {
  count = "${var.default_zone == "" ? 0 : 1}"

  project = "${google_project.project.project_id}"
  key     = "google-compute-default-zone"
  value   = "${var.default_zone}"
}

module "metadata_ssh_keys" {
  source = "modules/metadata-ssh-keys"

  ssh_users = "${var.ssh_users}"
}

resource "google_compute_project_metadata_item" "ssh_keys" {
  count = "${module.metadata_ssh_keys.mapping == "" ? 0 : 1}"

  project = "${google_project.project.project_id}"
  key     = "ssh-keys"
  value   = "${module.metadata_ssh_keys.mapping}"
}
