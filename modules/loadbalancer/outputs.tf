output "load_balancer_ip" {
  value       = google_compute_global_address.global_ip.address
  description = "The IP address of the Load Balancer"
}

output "load_balancer_url" {
  value       = "http://${google_compute_global_address.global_ip.address}"
  description = "The URL of the Load Balancer"
}

output "health_check_id" {
  value = google_compute_http_health_check.http_health_check.id
}

output "target-pool-id" {
  value = google_compute_target_pool.default.id
}

output "forwarding_rule_ip" {
  value = google_compute_global_address.global_ip.address
}
