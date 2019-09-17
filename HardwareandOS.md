# The hardware and OS and configuration

In order to make it work we need a docker compatible OS with 64bit architecture. We decide to go with Ubuntu that provide this kind of OS for Raspberry Pi3.

The download and installation procedure is descibed [here](https://ubuntu.com/download/iot/raspberry-pi-2-3).

We need also a big disk in order to store the data and the docker images. For this we will use a [SSD mSATA hardrive](https://www.kubii.fr/carte-sd-et-stockage/2074-kingspec-ssd-256gb-msata-kubii-3272496009370.html) connected with the [USB interface](https://www.kubii.fr/cartes-extension-cameras-raspberry-pi/2058-carte-d-extension-ssd-msata-x850-pour-rpi-kubii-3272496009189.html).

To be able to have a good way to manage this hardrive we configure it using [LVM](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/storage_administration_guide/ch-lvm1).

Our hadrive is attached as ```/dev/sda```

So to create the volume group

```
# pvcreate /dev/sda
# vgcreate vgdata /dev/sda
```

Then we created several Logical Volumes for our needs

```
# lvcreate -L 1G -n swap vgdata
# lvcreate -L 20G -n docker vgdata
# lvcreate -L 10G -n projects vgdata
# lvcreate -L 10G -n oriondb vgdata
# lvcreate -L 10G -n cometdb vgdata
```

Preparing the filesystems

```
# mkswap /dev/vgdata/swap
# mkfs.ext4 /dev/vgdata/docker
# mkfs.ext4 /dev/vgdata/projects
# mkfs.ext4 /dev/vgdata/oriondb
# mkfs.ext4 /dev/vgdata/cometdb
# mkdir /var/lib/docker
# mkdir /home/ubuntu/projects
# mkdir -p /var/data/oriondb
# mkdir -p /var/data/cometdb
```

Then use ```blkid``` with root privileges to retrieve UUID

```
/dev/mapper/vgdata-docker: UUID="f2b9a086-4895-4896-97c2-e4b06ed0ae0d" TYPE="ext4"
/dev/mapper/vgdata-projects: UUID="ac81ca17-587d-47e4-90d0-c3b027096cd1" TYPE="ext4"
/dev/mapper/vgdata-swap: UUID="35ffee27-b05a-4548-8003-04a468ef4df7" TYPE="swap"
/dev/mapper/vgdata-cometdb: UUID="1174662c-bc49-4cda-8172-99187c00143d" TYPE="ext4"
/dev/mapper/vgdata-oriondb: UUID="3b1d9a09-1cf5-4312-8578-a598afab06f9" TYPE="ext4"
```

The update /etc/fstab

```
UUID=35ffee27-b05a-4548-8003-04a468ef4df7   swap                    swap    defaults        0       0
UUID=ac81ca17-587d-47e4-90d0-c3b027096cd1   /home/ubuntu/projects   ext4    defaults        0       1
UUID=f2b9a086-4895-4896-97c2-e4b06ed0ae0d   /var/lib/docker         ext4    defaults        0       1
UUID=1174662c-bc49-4cda-8172-99187c00143d   /var/data/cometdb       ext4    defaults        0       1
UUID=3b1d9a09-1cf5-4312-8578-a598afab06f9   /var/data/oriondb       ext4    defaults        0       1
```

Then mount the volumes and adjust the rights

```
# mount -a
# chown ubuntu:ubuntu /home/ubuntu/projects
# swapon /dev/vgdata/swap
```

Finaly install Docker.io

```
# apt -y install docker.io
# adduser ubuntu docker
# systemctl start docker
# systemctl enable docker
```
You can now reboot the system to check everything works fine