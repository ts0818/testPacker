#!/bin/bash

VBOX_VERSION=$(cat /home/vagrant/.vbox_version)

# Mount the disk image
mkdir /media/iso
mount -t iso9660 -o loop /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso /media/iso

# Install the drivers
sh /media/iso/VBoxLinuxAdditions.run --nox11

# Cleanup
umount /media/iso
rm -rf /media/iso /home/vagrant/VBoxGuestAdditions_*.iso
unset VBOX_VERSION
