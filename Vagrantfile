# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Serveur virtuel de démonstration
  config.vm.define "srv-web" do |machine|
    machine.vm.hostname = "srv-web"
    machine.vm.box = "chavinje/fr-bull-64"
    machine.vm.network :private_network, ip: "192.168.56.80"
    machine.vm.network "forwarded_port", guest: 80, host: 8080
    # Un repertoire partagé est un plus mais demande beaucoup plus
    # de travail - a voir à la fin
    #machine.vm.synced_folder "./data", "/vagrant_data", SharedFoldersEnableSymlinksCreate: false

    machine.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--name", "srv-web"]
      v.customize ["modifyvm", :id, "--groups", "/S7-projet"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--memory", 2*1024]
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
      v.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
    end
    config.vm.provision "shell", inline: <<-SHELL
      sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config    
      sleep 3
      service ssh restart
    SHELL
    machine.vm.provision "shell", path: "scripts/install_sys.sh"
    machine.vm.provision "shell", path: "scripts/install_web.sh"
    machine.vm.provision "shell", path: "scripts/install_myadmin_web.sh"
  end

  config.vm.define "srv-bdd" do |machine2|
    machine2.vm.hostname = "srv-bdd"
    machine2.vm.box = "chavinje/fr-bull-64"
    machine2.vm.network :private_network, ip: "192.168.56.81"
    machine2.vm.network "forwarded_port", guest: 3306, host: 3306

    machine2.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--name", "srv-bdd"]
      v.customize ["modifyvm", :id, "--groups", "/S7-projet"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--memory", 2*1024]
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
      v.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
    end
    config.vm.provision "shell", inline: <<-SHELL
      sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config    
      sleep 3
      service ssh restart
    SHELL
    
    machine2.vm.provision "shell", path: "scripts/install_sys.sh"
    machine2.vm.provision "shell", path: "scripts/install_bdd.sh"
    machine2.vm.provision "shell", path: "scripts/install_myadmin_bdd.sh"
  end

  config.vm.define "srv-rp" do |machine4|
    machine4.vm.hostname = "srv-rp"
    machine4.vm.box = "chavinje/fr-bull-64"
    machine4.vm.network :private_network, ip: "192.168.56.123"
    machine4.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--name", "srv-rp"]
      v.customize ["modifyvm", :id, "--groups", "/S7-projet"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--memory", 2*1024]
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
      v.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
    end
    config.vm.provision "shell", inline: <<-SHELL
      sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config    
      sleep 3
      service ssh restart
    SHELL
    
    machine4.vm.provision "shell", path: "scripts/install_sys.sh"
    machine4.vm.provision "shell", path: "scripts/proxy.sh"
  end

  config.vm.define "srv-backup" do |machine3|
    machine3.vm.hostname = "srv-backup"
    machine3.vm.box = "chavinje/fr-bull-64"
    machine3.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--name", "srv-backup"]
      v.customize ["modifyvm", :id, "--groups", "/S7-projet"]
      v.customize ["modifyvm", :id, "--cpus", "2"]
      v.customize ["modifyvm", :id, "--memory", 2*1024]
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "off"]
      v.customize ["modifyvm", :id, "--natdnsproxy1", "off"]
    end
    config.vm.provision "shell", inline: <<-SHELL
      sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config    
      sleep 3
      service ssh restart
    SHELL
    
    machine3.vm.provision "shell", path: "scripts/install_sys.sh"
    machine3.vm.provision "shell", path: "scripts/backup.sh"
  end

end
