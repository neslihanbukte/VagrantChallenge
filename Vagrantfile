
Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/bionic64"
  #ağ çakışmalarını önlemek için özel ip adresi ataması.
  config.vm.network "private_network", ip: "192.168.56.10"

  config.vm.boot_timeout = 600

  #provisioning bash script 
  config.vm.provision "shell", path: "provision.sh"

  config.vm.synced_folder ".", "/vagrant" #flash koduna vm üzerinden kolayca erişebilme.

end
