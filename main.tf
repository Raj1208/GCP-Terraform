# module "vpc" {
#   source             = "./modules/vpc"
#   region             = var.region
#   availability_zones = ["us-central1-a", "us-central1-b"]  
#   public_subnet_cidr  = ["10.0.1.0/24", "10.0.2.0/24"]  # CIDR for public subnets
#   private_subnet_cidr = ["10.0.3.0/24", "10.0.4.0/24"] # CIDR for private subnets
#   data_subnet_cidr    = ["10.0.5.0/24", "10.0.6.0/24"]  # CIDR for data subnets
#   vpc_name            = "my-vpc"
# }

# module "firewall_rules" {
#   source              = "./modules/firewall"
#   vpc_network         = module.vpc.network
#   load_balancer_ip    = module.loadbalancer.load_balancer_ip

#  // bastion-ips = module.compute.bastion_ips
# }

# module "compute" {
#   source             = "./modules/compute"
#   region             = var.region
#   availability_zones = ["us-central1-a", "us-central1-b"]
#   vpc_network        = module.vpc.network
#   public_subnets     = module.vpc.public_subnets
#   private_subnets    = module.vpc.private_subnets
#   data_subnets       = module.vpc.data_subnets
#   target_pools =      [module.loadbalancer.target-pool-id]
 
#   //backend_instance_group = module.compute.instance_group_url
# }

# module "cloud_run" {
#   source        = "./modules/cloud_run"
#   service_name  = "my-cloud-run-service"
#   image         = "gcr.io/${var.project_id}/my-image:latest"
#   region        = var.region
#   project_id    = var.project_id
# }


# # }

# module "pg" {
#   source          = "./modules/postgres"

#   instance_name    = "mysql-instance"
#   tier             = "db-f1-micro"
#   db_name          = "pg_db"
#   # db_user          = "user"
#   # db_password      = "password"
#   database_version = "MYSQL_8_0"
# //  vpc_network = module.vpc.network


# }

module "mysql" {
  source = "./modules/postgres"
  
}
# resource "google_project_service" "project" {
#   service = "iam.googleapis.com"
# }

# module "loadbalancer" {
#   source               = "./modules/loadbalancer"

#   backend_service_name = "backend-service"
#   health_check_name    = "tcp-health-check"
#   health_check_port    = "80"
#   region               = var.region
#   target = module.compute.managed-group
#   forwarding_rule_name = "forwarding-rule"
#   global_ip_name       = "global-ip"
#   port_range           = "80"
# //  group-manager =  module.compute.managed-group

# }


# module "storage_bucket" {
#   source           = "./modules/storage_bucket"
#   bucket_name      = "rajchauhan-bucket1208"
#   location         = "US"
#   storage_class    = "STANDARD"
#   versioning       = "true"  

# }

# module "secret" {
#   source = "./modules/secters-manager"
#   file = "raj-1208-c945ae12ae21.json"
# }

