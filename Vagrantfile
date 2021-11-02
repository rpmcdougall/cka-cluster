Vagrant.configure("2") do |config|

  config.vm.define "master" do |master|
    master.vm.box = "ubuntu/focal64"
    master.vm.cpus = 2
    master.vm.memory = 8192
    master.vm.network "private_network", ip: "10.1.1.5"
  end

  config.vm.define "worker" do |worker| 
    worker.vm.box = "ubuntu/focal64"
    worker.vm.cpus = 2
    worker.vm.memory = 8192
    worker.vm.network "private_network", ip: "10.1.1.51"
  end

end
