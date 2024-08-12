
resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "ssh_private_key_pem" {
  content         = tls_private_key.ssh.private_key_pem
  filename        = ".ssh/public-vm/vm1"
  file_permission = "0600"
}

data "google_client_openid_userinfo" "me" {}

resource "google_compute_address" "bastion_static_ip" {
  count  = length(var.public_subnets)  # Number of Bastion hosts
  name   = "bastion-static-ip-${count.index}"
  region = var.region  
}



resource "google_compute_instance" "bastion" {
  count        = length(var.availability_zones)
  name         = "bastion-${count.index}"
  machine_type = "g1-small"
  zone         = element(var.availability_zones, count.index)
  boot_disk {
    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2204-lts"
    }
  }
  network_interface {
    network    = var.vpc_network
    subnetwork = element(var.public_subnets, count.index)
    access_config {
       nat_ip = google_compute_address.bastion_static_ip[count.index].address
    }
  }
  metadata = {
  
    ssh-keys = "${split("@", data.google_client_openid_userinfo.me.email)[0]}:${tls_private_key.ssh.public_key_openssh}"
  }
  metadata_startup_script = "sudo apt install nginx"
  tags = ["bastion"]
}


# resource "google_compute_instance" "private_instance" {
#   count        = length(var.private_subnets)
#   name         = "private-instance-${count.index}"
#   machine_type = "e2-medium"
#   zone         = element(var.availability_zones, count.index)

#   boot_disk {
#     initialize_params {
#       image = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2204-lts"
#     }
#   }

#   network_interface {
#     network    = var.vpc_network
#     subnetwork = element(var.private_subnets, count.index)

#     // If you're using private instances, you generally don't need access_config here.
#     // Access config is typically used for external IPs, which is unnecessary for private instances.
#     // access_config {
#     //   nat_ip = google_compute_address.private_static_ip[count.index].address
#     // }
#   }

#   metadata = {
#     ssh-keys = "${split("@", data.google_client_openid_userinfo.me.email)[0]}:${tls_private_key.ssh.public_key_openssh}"
#   }

#   tags = ["private-instance"]
# }





resource "google_compute_instance_template" "private_instance_template_v1" {
  name         = "private-instance-template-v1"
  machine_type = "g1-small"
  
  disk {
    auto_delete  = true
    boot          = true
    source_image = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2204-lts"
  }

  network_interface {
    network    = var.vpc_network
    subnetwork = element(var.private_subnets, 0)
    // No access_config needed for private subnet
  }
  metadata = {
  
    ssh-keys = "${split("@", data.google_client_openid_userinfo.me.email)[0]}:${tls_private_key.ssh.public_key_openssh}"
  }
  tags = ["private-instance"]
}

# resource "google_compute_instance_template" "private_instance_template_v2" {
#   name         = "private-instance-template-v2"
#   machine_type = "e2-medium"
  
#   disk {
#     auto_delete  = true
#     boot          = true
#     source_image = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2204-lts"
#   }

#   network_interface {
#     network    = var.vpc_network
#     subnetwork = element(var.private_subnets, 1)
#     // No access_config needed for private subnet
#   }
#   metadata = {
  
#     ssh-keys = "${split("@", data.google_client_openid_userinfo.me.email)[0]}:${tls_private_key.ssh.public_key_openssh}"
#   }
#   tags = ["private-instance-1"]
# }




# resource "google_compute_region_instance_group_manager" "group-manager" {


#   name                    = "group-manager"
#   region                  = "us-central1"

#   version {
#     instance_template = google_compute_instance_template.private_instance_template_v1.id
#     name              = "primary"
#   }
#   target_size= 2
#   target_pools       = var.target_pools

#   base_instance_name = "private-instance"

#   distribution_policy_zones  = ["us-central1-a", "us-central1-b"]

# }

# resource "google_compute_autoscaler" "autoscaler" {
#   name    = "autoscaler"
#   zone    = "us-central1-a"
#   target  = google_compute_region_instance_group_manager.group-manager.id

#   autoscaling_policy {
#     max_replicas    = var.lb_max_replicas
#     min_replicas    = var.lb_min_replicas
#     cooldown_period = var.lb_cooldown_period

#     cpu_utilization {
#       target = 1
#     }
#   }

#   depends_on = [google_compute_region_instance_group_manager.group-manager]
# }


# resource "google_compute_instance_group_manager" "backend_group_manager_2" {
#   name                    = "backend-group-manager-2"
#   base_instance_name     = "backend-instance-2"
#   zone                    = "us-central1-b"

#   version {
#     instance_template = google_compute_instance_template.private_instance_template2.id
#   }

#   target_size             = 1  # Adjust as needed
# }

# resource "google_compute_instance_template" "instance_template" {
#   name         = "private-instance-template"
#   machine_type = "e2-medium"

#   disk {
#     auto_delete = true
#     boot        = true

#       source_image = "projects/ubuntu-os-cloud/global/images/family/ubuntu-2204-lts"
    
#   }

#   network_interface {
#     network    = var.vpc_network
#     subnetwork = element(var.private_subnets, 0)
#   }

#   metadata = {
#     ssh-keys = "${split("@", data.google_client_openid_userinfo.me.email)[0]}:${tls_private_key.ssh.public_key_openssh}"
#   }

#   tags = ["private-instance"]

#   lifecycle {
#     create_before_destroy = true
#   }
# }
