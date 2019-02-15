/*
 * This file is part of the DevSecOps example.
 *
 * Copyright 2018 Crashtest Security GmbH <dev@crashtest-security.com>
 *
 * Author:  René Milzarek <rene@crashtest-security.com>
 *
 * All rights reserved.
 */


#-------------------------------------------------------------------------------
#                           Terraform & Providers
#-------------------------------------------------------------------------------
# Configure Terraform and the Google Cloud provider.
#-------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.11.8"
}

provider "google" {
  credentials = "${file("terraform-account.json")}"
  project     = "${var.google_project_id}"
  region      = "${var.google_region}"
}


#-------------------------------------------------------------------------------
#                               Google Project
#-------------------------------------------------------------------------------
# Configure the project, which was created manually from the `gcloud` CLI.
#-------------------------------------------------------------------------------


# Enable required Google APIs for the project
resource "google_project_services" "project" {
  project  = "${var.google_project_id}"
  services = [
    "appengine.googleapis.com",
    "appengineflex.googleapis.com",
    "bigquery-json.googleapis.com",
    "cloudbilling.googleapis.com",
    "cloudbuild.googleapis.com",
    "cloudkms.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "container.googleapis.com",
    "containeranalysis.googleapis.com",
    "containerregistry.googleapis.com",
    "compute.googleapis.com",
    "deploymentmanager.googleapis.com",
    "iam.googleapis.com",
    "iamcredentials.googleapis.com",
    "logging.googleapis.com",
    "monitoring.googleapis.com",
    "oslogin.googleapis.com",
    "pubsub.googleapis.com",
    "replicapool.googleapis.com",
    "replicapoolupdater.googleapis.com",
    "resourceviews.googleapis.com",
    "serviceusage.googleapis.com",
    "sourcerepo.googleapis.com",
    "storage-api.googleapis.com",
    "storage-component.googleapis.com"
  ]
}


#-------------------------------------------------------------------------------
#                             Google Cloud Build
#-------------------------------------------------------------------------------
# Adjust the permissions of the Google Cloud Build service account and create
# a key ring and key to store build secrets.
#-------------------------------------------------------------------------------

# NOTE: The build plan was configured manually and not via Terraform. Please
# refer to the readme file for detailed configuration steps.

# Grant the Google Cloud Build service account access to Google App Engine for
# the deployment of the application
resource "google_project_iam_member" "cloud_build_app_admin" {
  project = "${var.google_project_id}"
  role    = "roles/appengine.appAdmin"
  member  = "serviceAccount:${var.google_project_number}@cloudbuild.gserviceaccount.com"
}

resource "google_project_iam_member" "cloud_build_api_viewer" {
  project = "${var.google_project_id}"
  role    = "roles/serviceusage.serviceUsageViewer"
  member  = "serviceAccount:${var.google_project_number}@cloudbuild.gserviceaccount.com"
}

# Create a keyring and key for storing encrypted build secrets
resource "google_kms_key_ring" "cloud_build" {
  name     = "cloud-build-secrets-ring"
  location = "europe-west3"
}

resource "google_kms_crypto_key" "cloud_build" {
  name            = "cloud-build-secrets-key"
  key_ring        = "${google_kms_key_ring.cloud_build.self_link}"
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_kms_key_ring_iam_member" "key_ring" {
  key_ring_id = "${google_kms_key_ring.cloud_build.id}"
  role        = "roles/cloudkms.cryptoKeyDecrypter"
  member      = "serviceAccount:${var.google_project_number}@cloudbuild.gserviceaccount.com"
}
