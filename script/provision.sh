#!/usr/bin/env bash
echo "Provision script started"

# Get start timstamp to find the time it took for the whole script to run
startTimestamp=$(date +"%s")

# Fix "stdin is not a tty" in ubutnu
sed -i 's/^mesg n$/tty -s \&\& mesg n/g' /root/.profile
. .profile

# Disable the apt cache - We don't need it in a container and it would make the image bigger
echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache

# Upgrate distro
echo "Upgrate distro"
echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
apt-get -y -qq update
apt-get -y -qq dist-upgrade
apt-get -y -qq upgrade
apt-get install -f -qq

# Install basic tools
echo "Install basic tools"
apt-get install --assume-yes --force-yes -qq \
	build-essential \
	software-properties-common \
	vim \
	python-software-properties \
	curl \
	python-dev \
	wget \
	g++ libssl-dev make

# Install node.js
echo "Install node.js"
apt-add-repository ppa:chris-lea/node.js > /dev/null && apt-get update -qq
apt-get install --assume-yes --force-yes -qq nodejs

# Install and configure git
echo "Install and configure git"
apt-get install --assume-yes -qq git git-core git-gui git-doc
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
git config --global core.editor 'vim'
git config --global alias.co checkout
git config --global alias.st status
git config --global alias.br branch
git config --global core.autocrlf input

# Install docker.io
echo "Install docker.io"
apt-get install --assume-yes -qq docker.io
ln -sf /usr/bin/docker.io /usr/local/bin/docker

# Add 'vagrant' user to the docker group to run docker commands without sudo
usermod -aG docker vagrant

ln -s /vagrant/docker ~/docker

#Clean up
echo "Clean up"
apt-get remove --purge -qq $(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d') # Delete ALL older kernels using the shell
apt-get autoclean
apt-get clean
rm -r /var/cache/*/*
clear

# Check disk space
df -h

# Show much time it took for the whole script to run
endTimestamp=$(date +"%s")
diffTimestamp=$(($endTimestamp-$startTimestamp))
echo "Provision took $(($diffTimestamp / 60)) minutes and $(($diffTimestamp % 60)) seconds."
