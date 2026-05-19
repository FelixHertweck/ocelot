packer {
  required_plugins {
    ansible = {
      version = ">= 1.1.3"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

variable "ansible_host" {
  default = "default"
}

locals {
  version = formatdate("YYYY-MM-DD-hh-mm",timestamp())
}

source "openstack" "attacker" {
  flavor       = "client-medium"
  image_name   = "attacker-${local.version}"
  source_image_name = "kali-2025.2-cloud"
  ssh_username = "kali"
  networks = ["39a7e47a-f481-485a-9569-239258173b30"]
  floating_ip_network = "d118259f-1b00-462a-8293-999e1ddbe43e"
}

build {

  sources = ["source.openstack.attacker"]

  provisioner "file" {
    source      = "assets"
    destination = "/tmp"
  }

  provisioner "shell" {
    script = "./setup.sh"
  }
  
  provisioner "shell" {
    script = "./install.sh"
  }

}
