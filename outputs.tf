output "dns" {
  value = module.template.dns
}

output "nodes" {
  value = module.template.nodes
}

output "templates" {
  value = module.template.template
}

output "ip" {
    value = data.dns_a_record_set.pve_host
}