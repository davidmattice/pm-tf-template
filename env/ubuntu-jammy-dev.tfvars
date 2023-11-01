##############################
# Proxmox Virtual Environment 
##############################
pve_endpoint    = "https://192.168.1.95:8006/"
pve_user        = "root@pam"
pve_host_name   = "pm1.home.local"

##############################
# Template specifics
##############################
distro_url      = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
distro          = "ubuntu"
distro_name     = "jammy"
pve_template_id = 9090         # Template IDs should be unique and above 9080 for testing
additional_tags = ["template", "module", "testing"]