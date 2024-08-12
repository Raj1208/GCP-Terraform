

# # variable "region" {
# #   type = string
# # }

# # variable "public_subnets" {
# #   type = list(string)
# # }

# # variable "private_subnets" {
# #   type = list(string)
# # }

# # variable "backend_instance_group" {
# #   description = "The URL of the instance group to be used as backend for the load balancer"
# #   type        = string
# # }

# variable "group" {
#   type = string
# }

# variable "instance_group_name" {
#   description = "Name of the instance group"
#   type        = string
# }

# variable "instance_ids" {
#   description = "List of instance URLs"
#   type        = list(string)
# }


# variable "backend_service_name" {
#   description = "Name of the backend service"
#   type        = string
# }

# variable "health_check_name" {
#   description = "Name of the health check"
#   type        = string
# }

# # variable "health_check_id" {
# #   description = "ID of the health check"
# #   type        = string
# # }

# variable "region" {
#   description = "GCP region"
#   type        = string
# }

# # variable "zone" {
# #   description = "Zone for the instance group"
# #   type        = string
# # }

# variable "forwarding_rule_name" {
#   description = "Name of the forwarding rule"
#   type        = string
# }

# variable "global_ip_name" {
#   description = "Name of the global IP address"
#   type        = string
# }

# variable "port_range" {
#   description = "Port range for the forwarding rule"
#   type        = string
# }

# variable "health_check_port" {
#   description = "Port for the health check"
#   type        = number
# }

# variable "instance_group_manager_id" {
#   description = "ID of the instance group manager"
#   type        = string
# }

variable "health_check_name" {
  description = "Name of the health check"
  type        = string
}

variable "health_check_port" {
  description = "Port for the health check"
  type        = number
}

variable "backend_service_name" {
  description = "Name of the backend service"
  type        = string
}

variable "forwarding_rule_name" {
  description = "Name of the forwarding rule"
  type        = string
}

variable "port_range" {
  description = "Port range for the forwarding rule"
  type        = string
}

variable "global_ip_name" {
  description = "Name of the global IP address"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "target" {
  
}


# variable "group-manager" {
#   type = string
# }