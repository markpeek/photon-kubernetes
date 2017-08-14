
Vagrant.configure("2") do |config|
  config.vm.box = "vmware/photon"
  config.vm.network :forwarded_port, guest: 22, host: 2223, id: "ssh"
  config.vm.provider "vmware_fusion" do |v|
    v.vmx["memsize"] = 4096
  end
  config.ssh.forward_agent = true

  # Do initial update of packages/linux
  config.vm.provision "script_init", type: "shell", keep_color: true, path: "files/init.sh"

  # Reboot in order to sync kernel and userland
  config.vm.provision :reload

  config.vm.provision "file", source: "files/inputrc", destination: ".inputrc"

  config.vm.provision "docker", type: "shell", keep_color: true, path: "files/docker.sh"
  config.vm.provision "kubernetes", type: "shell", keep_color: true, path: "files/kubernetes.sh"

end
