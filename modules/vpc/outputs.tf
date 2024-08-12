output "network" {
  value = google_compute_network.vpc_network.name
}

output "public_subnets" {
  value = google_compute_subnetwork.public_subnet[*].id
}

output "private_subnets" {
  value = google_compute_subnetwork.private_subnet[*].id
}

output "data_subnets" {
  value = google_compute_subnetwork.data_subnet[*].id
}
