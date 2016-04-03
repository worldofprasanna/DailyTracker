Vagrant.configure(2) do |config|

  machines = [
      {
          :name => "thegoodtracker.local",
          :box => "hashicorp/precise64"
      }
  ]

  machines.each do |machine|
    config.vm.define machine[:name] do |instance|
      instance.vm.box = machine[:box]
      instance.vm.hostname = machine[:name]
    end
  end

config.vm.network "private_network", ip: "192.168.33.10"
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "ansible/app.yml"
  end

end

