# Build Packer command
# $ packer build .

build {
  sources = ["source.hcloud.base"]
  name = "base"

  provisioner "ansible" {
    playbook_file    = "./ansible/playbook.yaml"
    galaxy_file      = "./ansible/requirements.yaml"
    extra_arguments  = ["-vvvv"]
    ansible_env_vars = [ "ANSIBLE_STRATEGY=debug" ]

    // You don't need to specify the collections_path or roles_path. Ansible will download those gallery collections in ~/.ansible.
    // collections_path = "./ansible/collections"
    // roles_path       = "./ansible/roles"
  }
}
