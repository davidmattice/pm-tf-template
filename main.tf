
data "dns_a_record_set" "pve_host" {
  host = var.pve_host_name
}

module "template" {
  source          = "git::https://github.com/davidmattice/pve-tfm-template?ref=v1.x"
  providers = {
    proxmox = proxmox
  }
  pve_endpoint    = var.pve_endpoint
  pve_user        = var.pve_user
  pve_template_id = var.pve_template_id
  bios_type       = var.bios_type
  distro          = var.distro
  distro_name     = var.distro_name
  distro_url      = var.distro_url
  additional_tags = var.additional_tags
  pve_template_version_tag = var.pve_template_version_tag
}
