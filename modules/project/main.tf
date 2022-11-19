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

data "google_project" "project" {
  project_id = try(google_project.in_folder[0].project_id, google_project.top_level[0].project_id)
}

resource "google_project" "in_folder" {
  count = var.folder_id == null ? 0 : 1

  auto_create_network = var.auto_create_network
  billing_account     = var.billing_account
  folder_id           = var.folder_id
  labels              = var.project_labels
  name                = var.project_name
  project_id          = join("-", [random_pet.name.id, random_id.project.hex])
  skip_delete         = var.skip_delete
}

resource "google_project" "top_level" {
  count = var.folder_id == null ? 1 : 0

  auto_create_network = var.auto_create_network
  billing_account     = var.billing_account
  labels              = var.project_labels
  name                = var.project_name
  org_id              = var.org_id
  project_id          = join("-", [random_pet.name.id, random_id.project.hex])
  skip_delete         = var.skip_delete
}

resource "random_id" "project" {
  byte_length = 4
}

resource "random_pet" "name" {
}
