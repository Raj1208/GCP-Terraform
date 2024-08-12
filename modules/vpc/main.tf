resource "google_compute_network" "vpc_network" {
  name = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "public_subnet" {
  count         = length(var.availability_zones)
  name          = "public-subnet-${count.index}"
  network       = google_compute_network.vpc_network.id
   ip_cidr_range  = var.public_subnet_cidr[count.index]
  region         = var.region
}

resource "google_compute_subnetwork" "private_subnet" {
  count         = length(var.availability_zones)
  name          = "private-subnet-${count.index}"
  network       = google_compute_network.vpc_network.id
  ip_cidr_range  = var.private_subnet_cidr[count.index]
  region         = var.region
}

resource "google_compute_subnetwork" "data_subnet" {
  count         = length(var.availability_zones)
  name          = "data-subnet-${count.index}"
  network       = google_compute_network.vpc_network.id
  ip_cidr_range  = var.data_subnet_cidr[count.index]
  region         = var.region
}



resource "google_compute_router" "nat_router" {
  name    = "nat-router"
  network = google_compute_network.vpc_network.id
  region  = var.region
}

resource "google_compute_router_nat" "nat_gateway" {
  name   = "nat-gateway"
  router = google_compute_router.nat_router.name
  region = var.region

  nat_ip_allocate_option = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

resource "google_compute_route" "default_internet" {
  name        = "default-internet"
  network     = google_compute_network.vpc_network.id
  dest_range = "0.0.0.0/0"
  priority    = 1000

  next_hop_gateway = "default-internet-gateway"

}

