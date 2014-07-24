# Vagrant for Docker

Vagrant box based on ubuntu 14.04 LTS with [Docker](https://www.docker.com/) (docker.io package) and basic tools including:

 * htop
 * dnsutils
 * wget
 * make
 * curl
 * vim
 * node.js
 * git

## The box in numbers

 * Basic image filesize: <800mb stored in S3
 * Provision duration: <1minute [provision script](https://github.com/georgeyord/vagrant-docker/blob/master/script/provision.sh)

## Vagrant tips

### VirtualBox's Guest additions (Required Vagrant ≥ 1.1)

Install [vagrant-vbguest](https://github.com/dotless-de/vagrant-vbguest) to have vagrant auto-sync the guest additions of the VM

```bash
$ vagrant plugin install vagrant-vbguest
```

## Docker tips

If you are new to Docker lets start with the definition:

> Docker is a platform for developers and sysadmins to develop, ship, and run applications.
> Docker lets you quickly assemble applications from components and eliminates the friction that can come when shipping code.
> Docker lets you get your code tested and deployed into production as fast as possible.

And then go to the [UserGuide](https://docs.docker.com/userguide/).
