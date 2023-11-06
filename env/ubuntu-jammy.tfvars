##############################
# Proxmox Virtual Environment 
##############################
pve_host_name   = "pm1.home.local"

##############################
# Template specifics
##############################
distro_url               = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
distro                   = "ubuntu"
distro_name              = "jammy"
pve_template_id          = 9091         # Template IDs should be unique and above 9080 for testing
additional_tags          = ["template", "module", "testing", "ovmf"]
pve_template_version_tag = "prod"
bios_type                = "ovmf"
