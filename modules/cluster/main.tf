resource "google_container_cluster" "firstcluster" {
  name                     = var.cluster_name
  location                 = var.region
  network                  = var.network_name
  subnetwork               = var.subnetwork_name
  remove_default_node_pool = true
  initial_node_count       = 2
}


resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = var.node_pool_name
  location   = var.region
  cluster    = google_container_cluster.firstcluster.name
  node_count = 2


  node_config {
    preemptible  = true
    machine_type = var.node_machine

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = var.google_service_account_email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
