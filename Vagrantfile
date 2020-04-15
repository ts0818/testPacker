# Configuration Version
VAGRANTFILE_API_VERSION = "2" 

# Vagrant configuration
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config| 
  
  # config.vagrant.plugins = ["vagrant-registration", "vagrant-vbguest", "dotenv"]
  config.vagrant.plugins = ["vagrant-vbguest", "dotenv"]
  
  # Guest additions not install during packaging
  # config.vm.synced_folder '.', '/vagrant', disabled: true
  config.vbguest.auto_update = false 
  config.ssh.insert_key = false
  
  if Vagrant.has_plugin?("dotenv")
    Dotenv.load
  end 

  rhel_version = 8.0
  if "#{ENV['RHEL_VERSION']}" != ""
    rhel_version = "#{ENV['RHEL_VERSION']}"
  end

#  use_activationkey = false
#  if "#{ENV['RHSM_ACTIVATIONKEY']}" != ""
#    use_activationkey = true
#  end

  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.enabled = false
  end  

# manage Red Had subscription model (like Red Hat Enterprise Linux).
#  if Vagrant.has_plugin?('vagrant-registration')
#    #config.registration.skip = true
#    config.registration.name = "packer-rhel"
#    if use_activationkey
#      config.registration.org = "#{ENV['RHSM_ORG']}" 
#      config.registration.activationkey = "#{ENV['RHSM_ACTIVATIONKEY']}"
#    else
#      config.registration.username = "#{ENV['RHSM_USERNAME']}" 
#      config.registration.password = "#{ENV['RHSM_PASSWORD']}" 
#    end
#  end    
       
    
    config.vm.box = "centos/#{rhel_version}"
    config.vm.box_url = "file:///C:/Users/Toshinobu/Desktop/soft_work/virtualbox_work/centos8/box/vbox-rhel-#{rhel_version}-x86_64.box"
    
    # define "machine-master-node"
    config.vm.define "machine-master-node" do |machine|
      machine.vm.hostname = "master"
      machine.vm.synced_folder ".", "/vagrant", disabled: true
      machine.vm.network :forwarded_port, id: "ssh", guest: 22, host: 2222
      machine.vm.network "private_network", ip: "192.168.31.101", hostsupdater: "skip"
    end
    
    # define "machine-worker-node-01"
    config.vm.define "machine-worker-node-01" do |machine|
      machine.vm.hostname = "worker-node-01"
      machine.vm.synced_folder ".", "/vagrant", disabled: true
      machine.vm.network :forwarded_port, id: "ssh", guest: 22, host: 2223
      machine.vm.network "private_network", ip: "192.168.31.102", hostsupdater: "skip"
    end
    
    # define "machine-worker-node_02"
    config.vm.define "machine-worker-node-02" do |machine|
      machine.vm.hostname = "worker-node-02"
      machine.vm.synced_folder ".", "/vagrant", disabled: true
      machine.vm.network :forwarded_port, id: "ssh", guest: 22, host: 2224
      machine.vm.network "private_network", ip: "192.168.31.103", hostsupdater: "skip"
    end

    config.vm.provider :virtualbox do |v|
      v.gui = false
      v.memory = 2048
      v.cpus = 2
    end

    config.vm.provision "shell", inline: "echo Hello, World"


end