variable "project_id" {
  default = "kuber-project-348112"
}

variable "region" {
  default = "europe-central2-a"
}

variable "service_account_id" {
  default = "terraformacc"
}

variable "network_name" {
  default = "custom_vpc_name"
}

variable "subnetwork_name" {
  default = "subnetwork"
}

variable "cidr_range_ip" {
  default = "10.2.0.0/16"
}

variable "service_account_name" {
  default = "terraform"
}

variable "cluster_name" {
  default = "customcluster"
}

variable "node_pool_name" {
  default = "pool_whatizlove"
}
variable "node_machine" {
  default = "e2.micro"
}
