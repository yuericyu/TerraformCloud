variable "tenancy_ocid" {
  type = string
  description = "Oracle cloud tenancy ocid"
}

variable "user_ocid" {
  type = string
  description = "Oracle cloud user ocid"
}

variable "fingerprint" {
  type = string
  description = "Oracle cloud user API key fingerprint"
}

variable "compartment_ocid" {
  type = string
  description = "Oracle cloud user compartment ocid"
}

variable "region" {
  type = string
  description = "Oracle cloud account region"
}

variable "private_key_path" {
  type = string
  description = "Oracle cloud account private key file location and name"  
}

variable "ssh_public_key" {
  type = string
  description = "Public key for the vps ssh login"   
}


variable "instance_shape" {
  #default = "VM.Standard.A1.Flex" # Or VM.Standard.E2.1.Micro
  default = "VM.Standard.E2.1.Micro"
}

variable "instance_ocpus" { default = 1 }

variable "instance_shape_config_memory_in_gbs" { default = 1 }

data "oci_identity_availability_domain" "ad" {
  compartment_id = var.tenancy_ocid
  ad_number      = 1
}

# See https://docs.oracle.com/iaas/images/
data "oci_core_images" "oracle_lunux_8" {
  compartment_id           = var.compartment_ocid
  operating_system         = "Oracle Linux"
  operating_system_version = "8"
  shape                    = var.instance_shape
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}

data "oci_core_images" "ubuntu_2204" {
  compartment_id           = var.compartment_ocid
  operating_system         = "Canonical Ubuntu"
  operating_system_version = "22.04"
  shape                    = var.instance_shape
  sort_by                  = "TIMECREATED"
  sort_order               = "DESC"
}