/*
 * This file is part of the DevSecOps example.
 *
 * Copyright 2018 Crashtest Security GmbH <dev@crashtest-security.com>
 *
 * Author:  René Milzarek <rene@crashtest-security.com>
 *
 * All rights reserved.
 */


variable "google_project_id" {
  type        = "string"
  description = "Google Cloud Platform project identifier."
}

variable "google_project_number" {
  type        = "string"
  description = "Google Cloud Platform project number (numeric)."
}

variable "google_region" {
  type        = "string"
  description = "Google Cloud Platform region."
  default     = "europe-west3" # Germany - Frankfurt Region
}

