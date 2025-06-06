output "internal_ips" {
  value = {
    for i in google_compute_instance.vm :
    i.name => i.network_interface[0].network_ip
  }
}

output "external_ips" {
  value = {
    for i in google_compute_instance.vm :
    i.name => (
      length(i.network_interface[0].access_config) > 0 ?
      i.network_interface[0].access_config[0].nat_ip :
      null
    )
  }
}

output "vm_names" {
  value = google_compute_instance.vm[*].name
}
