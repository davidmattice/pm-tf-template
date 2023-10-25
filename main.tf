

module "template" {
  source          = "git::https://github.com/davidmattice/pve-tfm-template?ref=initial"
  providers = {
    proxmox = proxmox
  }
  #source          = "./modules/template"
  pve_endpoint    = var.pve_endpoint
  pve_user        = var.pve_user
  pve_template_id = var.pve_template_id
  distro          = var.distro
  distro_name     = var.distro_name
  distro_url      = var.distro_url
}
