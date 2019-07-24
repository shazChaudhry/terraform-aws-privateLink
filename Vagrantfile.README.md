The assumption is that you already have VirtualBox and Vagrant installed on your system
- The provided vagrantfile spins up ubuntu-18.04 and installs `Terraform v0.12.3`
- Install Vagrant Host Manager plugin which will update host files on both guest and host machines.
  - `vagrant plugin install vagrant-hostmanager`
- `vagrant up --color`
- `vagrant ssh`
