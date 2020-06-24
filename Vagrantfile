Vagrant.configure("2") do |config|

  config.vm.synced_folder "~/DevNew/code", "/var/www"

  config.vm.network :public_network, :bridge => "en0: Wi-Fi (AirPort)"

  config.vm.provision "shell", inline: "apt-get update && apt-get -y upgrade"

  config.vm.define "ubuntu18" do |master|
    master.vm.box = "ubuntu/bionic64"
    master.vm.network "private_network",ip: "192.168.100.25"
      master.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 2
    end
  end

end
