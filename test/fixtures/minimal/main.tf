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

data "google_compute_zones" "available" {
  project = var.project_id
  region  = "europe-west1"
  status  = "UP"
}

module "gcp_project" {
  source = "../../../"

  billing_account = var.billing_account
  default_region  = data.google_compute_zones.available.region
  default_zone    = element(data.google_compute_zones.available.names, 0)
  labels          = {}
  org_id          = var.org_id
  project_name    = random_pet.project_name.id
}

resource "random_pet" "project_name" {
  prefix = "test"
}
