provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_container_registry" "registry" {
  project  = var.project_id
  location = "EU"
}

resource "google_service_account" "service_account" {
  account_id   = var.service_account_id
  display_name = var.service_account_name
  project = var.project_id
  
}



module "network" {
  source = "./modules/network"

  project_id = var.project_id
  region = var.region
  cidr_range_ip = var.cidr_range_ip
  subnetwork_name = var.subnetwork_name
  network_name = var.network_name
}

module "cluster" {
  source = "./modules/cluster"
  
  cluster_name = var.cluster_name
  region = var.region
  network_name = var.network_name
  subnetwork_name = var.subnetwork_name
  node_machine = var.node_machine
  node_pool_name = var.node_pool_name
  google_service_account_email = google_service_account.service_account.email
}