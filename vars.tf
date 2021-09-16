variable "project" {}
variable "region" {}
variable "vmName" {}
variable "allowed_src_ip_ranges" {}
variable "username" {}
variable "ssh_public_key" {}
variable "vmSize" {
    default = "n1-standard-1"
}

# gcloud compute images list --filter ubuntu-os-cloud
variable "image_name" {
    default = "ubuntu-os-cloud/ubuntu-2004-lts"
}

variable "cns_api" {}
variable "cns_namespace" {}
