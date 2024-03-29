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

module "gcp_project" {
  source = "../../../"

  billing_account = var.billing_account
  default_zone    = "europe-west1-b"

  iam_audit_config = {
    allServices = {
      ADMIN_READ = {
        exempted_members = [
        ]
      }
      DATA_READ = {
        exempted_members = [
        ]
      }
      DATA_WRITE = {
        exempted_members = [
        ]
      }
    }
  }

  labels = {
    audit_config = "enabled"
  }

  org_id       = var.org_id
  project_id   = random_pet.project_name.id
  project_name = random_pet.project_name.id

  project_service_identities = [
    {
      api   = "compute.googleapis.com"
      roles = ["roles/editor"]
    }
  ]

  random_project_id_byte_length = 8

  ssh_users = {
    foo = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAEAQDLm..."
    bar = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAEAQDLn..."
  }
}

resource "random_pet" "project_name" {
  prefix = "test"
}
