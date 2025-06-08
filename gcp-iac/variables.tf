variable "project_id" {
  description = "GCP project ID"
  default = "vamos-aplikacje-w-chmurze"
  type        = string
}

variable "region" {
  default = "europe-west3"
}

variable "zone" {
  default = "europe-west3-a"
}

variable "machine_type" {
  default = "e2-micro"
}

variable "vm_names" {
  type    = list(string)
  default = ["ansible", "db", "backend", "frontend"]
}

variable "vm_tags" {
  type = map(list(string))
  default = {
    ansible  = ["allow-ssh"]
    frontend = ["allow-ssh", "allow-http"]
    backend  = ["allow-backend"]
    db       = ["allow-db"]
  }
}

variable "vm_internal_ips" {
  type    = list(string)
  default = ["192.168.56.10", "192.168.56.11", "192.168.56.12", "192.168.56.13"]
}

variable "vm_external_ips" {
  type    = map(bool)
  default = {
    ansible  = true
    frontend = true
    backend  = false
    db       = false
  }
}

variable "ansible_ssh_key_pub_path" {
  default = "~/.ssh/google_compute_engine.pub"
}
