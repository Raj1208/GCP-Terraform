output "bastion_ips" {
  value = google_compute_instance.bastion[*].network_interface[0].access_config[0].nat_ip
}


# output "instance_group_url" {
#   value = google_compute_instance_group_manager.backend_group_manager_1.instance_group
# }
# output "instance_group_url2" {
#   value = google_compute_instance_group_manager.backend_group_manager_2.instance_group
# }


# output "instance_urls" {
#   description = "List of URLs for the private instances"
#   value       = google_compute_instance.private_instance[*].self_link
# }

# output "instance_group_manager_id" {
#   value = google_compute_region_instance_group_manager.instance_group_manager.id
# }

# output "instance_template_v1_self_link" {
#   value = google_compute_instance_template.private_instance_template_v1.self_link
# }

# output "instance_template_v2_self_link" {
#   value = google_compute_instance_template.private_instance_template_v2.self_link
# }

# output "global_ip_address" {
#   value = google_compute_global_address.global_ip.address
# }

# output "managed-group" {
#   value = google_compute_region_instance_group_manager.group-manager.name
# }