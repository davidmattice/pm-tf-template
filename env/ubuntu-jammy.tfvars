# Proxmox Virtual Environment 
pve_endpoint    = "https://192.168.1.95:8006/"
pve_user        = "root@pam"
pve_host_name   = "pm1.home.local"
pve_template_id = 9011      # Template IDs should be unique and above 9000
pve_template_version_tag = "prod"
bios_type = "ovmf"

# Template specifics
distro_url      = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
distro          = "ubuntu"
distro_name     = "jammy"
additional_tags = ["docker"]
