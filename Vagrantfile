# -*- mode: ruby -*-
# vi: set ft=ruby :

###############################################################################
# Vagrant file for ubuntu server 14
# Author: Tran Tuan Phuong
# Created at: 02/10/2014
###############################################################################

# Vagrant plugin:
# vagrant plugin install vagrant-librarian-chef
# vagrant plugin install vagrant-omnibus


# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu14"
  confit.vm.box_url = "https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vbox.box"
  
  config.vm.network :forwarded_port, guest: 8080, host: 8080, :auto_correct => true
  config.vm.network :forwarded_port, guest: 3000, host: 3000, :auto_correct => true
  config.vm.network :forwarded_port, guest: 80, host: 3000, :auto_correct => true
  
  config.omnibus.chef_version = :latest

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks"]

    chef.add_recipe "apt"	
    chef.add_recipe "build-essential"
    chef.add_recipe "nodejs"
    chef.add_recipe "mysql::client"
    chef.add_recipe "mysql::server"	
    chef.add_recipe "ruby_build"
	chef.add_recipe "rbenv::user"
	chef.add_recipe "rbenv::vagrant"	
    chef.add_recipe "git"
	chef.add_recipe "user"
	chef.add_recipe "sudo"
    chef.add_recipe "vim"

    chef.json = {
      mysql: {
        server_root_password: 'root'
      },
	  authorization: {
        sudo: {
          passwordless: true,
          groups: ["admin", "sudo"]
        }
      },
      rbenv: {
        user_installs: [{
          user: 'vagrant',
          rubies: ["2.1.2"],
          global: "2.1.2",
          gems: {
            "2.1.2" => [
			  { name: 'bundler' }, 
              { name: "rails" }
            ]
          }
        }]
      }
    }
  end
  
  config.vm.provision :shell, :path => './shellscript/vagrant.sh', privileged: false
end
