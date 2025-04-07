data "google_service_account" "terraform_admin" {
  account_id = "terraform-admin"
  project    = var.project_id
}

resource "google_project_iam_member" "iam_member" {
  project = var.project_id
  role    = "roles/owner"
  member  = "serviceAccount:${data.google_service_account.terraform_admin.email}"
}

resource "google_project_iam_binding" "add_security_admin" {
  project = var.project_id
  role    = "roles/iam.securityAdmin"

  members = [
    "serviceAccount:${data.google_service_account.terraform_admin.email}"
  ]
}
