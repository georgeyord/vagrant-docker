# Vagrant for Docker

Vagrant[http://www.vagrantup.com/](?) box based on ubuntu 14.04 LTS with [https://www.docker.com/](Docker) (docker.io package) and basic tools including:

 * vim
 * curl
 * wget
 * make
 * node.js
 * git

## The box in numbers

Basic image filesize: <800mb stored in S3
Provision duration: <10minutes

## Vagrant tips

### VirtualBox's Geust additions (Required Vagrant ≥ 1.1)

Install [https://github.com/dotless-de/vagrant-vbguest](vagrant-vbguest) to have vagrant auto-sync the guest additions of the VM

```bash
$ vagrant plugin install vagrant-vbguest
```

## Docker tips

If you are new to Docker lets start whith the definition:

> Docker is a platform for developers and sysadmins to develop, ship, and run applications.
> Docker lets you quickly assemble applications from components and eliminates the friction that can come when shipping code.
> Docker lets you get your code tested and deployed into production as fast as possible.

And then go to the [https://docs.docker.com/userguide/](UserGuide).
