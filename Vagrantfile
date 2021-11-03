Vagrant.configure("2") do |config|

  config.vm.define "master" do |master|
    master.vm.box = "ubuntu/focal64"

    master.vm.provider "virtualbox" do |v| 
      v.memory = 8192
      v.cpus = 2
    end
    master.vm.network "private_network", ip: "10.1.1.5"
    master.vm.provision "shell", path: "bootstrap.sh"
  end

  config.vm.define "worker" do |worker| 
    worker.vm.box = "ubuntu/focal64"
    worker.vm.provider "virtualbox" do |v| 
      v.memory = 8192
      v.cpus = 2
    end

    worker.vm.network "private_network", ip: "10.1.1.51"
    worker.vm.provision "shell", path: "bootstrap.sh"
  end

end
