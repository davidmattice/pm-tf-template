variable "pve_endpoint" {
    description = "Endpoint URL for PVE environment"
    type        = string
}

variable "pve_user" {
    description = "User name for Terraform Updates"
    type        = string
}

# variable "pve_pass" {}  # This is expect to be passed as and Environment variable - PROXMOX_VE_PASSWORD

variable "pve_host_ip_1" {
    description = "IP of the first host in the PVE cluster"
    type        = string
    
}

variable "pve_template_id" {
    description = "This is the ID of this tempalte.  Must be unique for each template."
    type        = string
}

variable "pve_host_ip_2" {
    description = "IP of the 2nd host in the cluster (if there is more than 1)"
    type        = string
    default     = null
}

variable "distro" {
    description = "This is the distro name that will be used in the template name"
    type        = string
}

variable "distro_name" {
    description = "This is the name of the version to use from this distro"
    type        = string
}

variable "distro_url" {
    description = "This is the full path URL to the ISO image to be pulled down"
    type        = string
}