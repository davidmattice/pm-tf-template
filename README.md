# proxmox-terraform
Proxmox K8s Home Lab Server Configuration

## Install Proxmox

- Download Proxmox from [here](https://www.proxmox.com/en/proxmox-virtual-environment/get-started) and follow the instructions to write to an ISO or USB boot drive

## Install Terraform


```
if [ $UID -ne 0 ]; then
    export SUDO="sudo"
else
    export SUDO=""
fi
wget -O - https://apt.releases.hashicorp.com/gpg | ${SUDO} gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep VERSION_CODENAME /etc/os-release | cut -f 2 -d =) main" | ${SUDO} tee /etc/apt/sources.list.d/hashicorp.list
${SUDO} apt update && ${SUDO} apt install -y terraform
```

## Using TF for PVE

- Set the PROXMOX_VE_PASSWORD environment variable
- Clone the TF repo - https://github.com/davidmattice/proxmox-terraform


## Using Terraform

```
terraform plan -var-file=env/pm1.tfvars -input=false -out=tf.plan
terraform apply -input=false tf.plan
```

## The BPG Proxmox Terraform Provider

- [BPG Proxmox Provider](https://registry.terraform.io/providers/bpg/proxmox/latest/docs)
- [BPG Examples](https://github.com/bpg/terraform-provider-proxmox/tree/main/example)

## Reference repositories

- [My home operations repo using K8](https://github.com/szinn/k8s-homelab)
- [Small Home Lab for K8 using PVE](https://github.com/ehlesp/smallab-k8s-pve-guide)

## Secondary References

- [Cloud Init Template Builder Script](https://gist.github.com/chris2k20)
- [Cloud-Init file reference](https://github.com/chris2k20/proxmox-cloud-init/tree/main)
- [ProxMox Cloud Init Examples](https://dustinrue.com/2020/05/going-deeper-with-proxmox-cloud-init/)
