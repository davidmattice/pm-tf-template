##############################
# Proxmox Virtual Environment 
##############################
variable "pve_endpoint" {
    description = "Endpoint URL for PVE environment"
    type        = string
}

variable "pve_user" {
    description = "User name for Terraform Updates.  Required and uses "
    type        = string
}

# variable "pve_pass" {}  # This is expect to be passed as and Environment variable - PROXMOX_VE_PASSWORD

variable "pve_host_name" {
    description = "PVE hostname to create this template on.  Defaults to first host in the Cluster."
    type        = string
    default     = ""
}


##############################
# Template Details
##############################
variable "pve_template_id" {
    description = "This is the ID of this tempalte.  Must be unique for each template."
    type        = string
}
variable "pve_template_version_tag" {
    description = "This is the version tag to apply to this telplate."
    type        = string
    default     = "dev"
}

variable "distro_url" {
    description = "This is the full path URL to the ISO image to be pulled down"
    type        = string
}
variable "distro" {
    description = "This is the distro name that will be used in the template name"
    type        = string
}

variable "distro_name" {
    description = "This is the name of the version to use from this distro"
    type        = string
}

variable "bios_type" {
    description = "Select the bios type for the template and VMs cloned from it.  Must be either \"seabios\" or \"ovmf\"."
    type        = string
    default     = "seabios"
    validation {
      condition = contains(["seabios","ovmf"], var.bios_type)
      error_message = "Bios typ emust be one of \"seabios\" or \"ovmf\""
    }
}

variable "additional_tags" {
    description = "Additional custom tags to add to the template being created"
    type        = list(string)
    default     = []
}