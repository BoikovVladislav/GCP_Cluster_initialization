resource "google_compute_network" "vpc_network" {
  project = var.project_id
  name                    = var.network_name
  auto_create_subnetworks = false
  mtu                     = 1460
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "vpc_subnet" {
  name          = var.subnetwork_name
  ip_cidr_range = var.cidr_range_ip
  region        = var.region
  network       = google_compute_network.vpc_network.id
  depends_on = [
    google_compute_network.vpc_network
  ]
}
