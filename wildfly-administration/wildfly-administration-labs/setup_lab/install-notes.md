# Lab config

* VirtualBox with CentOS 7 - https://wiki.centos.org/HowTos/Virtualization/VirtualBox/CentOSguest
* Server with Graphical UI + Java
* Automatic screen lock disabled
* bridged network mode

```
yum update -y
yum install -y yum-plugin-priorities epel-release
yum repolist

# https://docs.docker.com/engine/installation/linux/docker-ce/centos/#install-docker-ce
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce
cat <<EOT >/etc/docker/daemon.json
{
  "storage-driver": "devicemapper",
  "storage-opts": [
    "dm.loopmetadatasize=1G",
    "dm.loopdatasize=5G"
  ]
}
EOT

systemctl start docker
systemctl enable docker

groupadd docker
sudo usermod -aG docker student

yum install -y dkms gcc make kernel-devel
# and install Virtual Box Guest Additions

yum install -y terminator geany nghttp2 maven git tree

echo "127.0.0.1 my-server.my-company.example" >> /etc/hosts

yum clean all
rm -rf /var/cache/yum
```
