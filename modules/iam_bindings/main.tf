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

resource "google_project_iam_binding" "basic_role" {
  /* There are several basic roles that existed prior to the introduction of IAM:
      Owner, Editor, and Viewer. These roles are concentric; that is, the Owner role includes the permissions in the Editor role,
      and the Editor role includes the permissions in the Viewer role. They were originally known as "primitive roles."

     Caution:
      Basic roles include thousands of permissions across all Google Cloud services.
      In production environments, do not grant basic roles unless there is no alternative.
      Instead, grant the most limited predefined roles or custom roles that meet your needs. */

  for_each = {
    // All viewer permissions, plus permissions for actions that modify state, such as changing existing resources.
    editor = var.editors

    /* All editor permissions and permissions for the following actions:
            - Manage roles and permissions for a project and all resources within the project.
            - Set up billing for a project. */
    owner = var.owners

    /* Permissions for read-only actions that do not affect state,
        such as viewing (but not modifying) existing resources or data. */
    viewer = var.viewers
  }

  members = each.value
  project = var.project_id
  role    = "roles/${each.key}"
}
