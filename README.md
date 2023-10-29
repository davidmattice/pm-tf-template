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

- Set the Proxmox Provider password
```
export PROXMOX_VE_PASSWORD=""
```


## Using Terraform

This is a little helper function to add to *.bashrc*
```
function tf {
    local tfvars_file=${2##*/}
    local wksp=${tfvars_file%%.*}
    local tf_cmd="/usr/bin/terraform"

    # To help in debugging uncomment the line below
    #echo "${tf_cmd}, ${2}, ${tfvars_file}, ${wksp}"

    case "$1" in
        plan)
            rm -rf .terraform 2>/dev/null
            ${tf_cmd} init -input=false
            if [ $? -eq 0 ]; then
                ${tf_cmd} workspace select ${wksp}
                if [ $? -ne 0 ]; then
                    ${tf_cmd} workspace new ${wksp}
                fi
                if [ $? -eq 0 ]; then
                    ${tf_cmd} plan -input=false -out=${wksp}.plan -var-file=${2} ${*:3}
                fi
            fi
            ;;
        apply)
            ${tf_cmd} apply -input=false ${wksp}.plan ${*:3}
            ;;
        *)
            ${tf_cmd} $*
            ;;
    esac
  }
```
Using the function above you can run a simplified plan and apply, or any other terraform command
```
tf plan env/pm1.tfvars [-destroy]
tf apply env/file.tfvars [other options]
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
