output "instance0_public_ip" {
  description = "Public IP of OCI instance0"
  value       = oci_core_instance.free_instance0.public_ip
}

output "image_name" {
    description = "image name"
    value = data.oci_core_images.ubuntu_2204.images[0].id
}