#!/bin/sh
## one script to be used by travis, jenkins, packer...

umask 022

if [ $# != 0 ]; then
rolesdir=$1
else
rolesdir=$(dirname $0)/..
fi

[ ! -d $rolesdir/juju4.maxmind ] && git clone https://github.com/juju4/ansible-maxmind $rolesdir/juju4.maxmind
[ ! -d $rolesdir/juju4.redhat_epel ] && git clone https://github.com/juju4/ansible-redhat-epel $rolesdir/juju4.redhat_epel
[ ! -d $rolesdir/kbrebanov.selinux ] && git clone https://github.com/kbrebanov/ansible-selinux.git $rolesdir/kbrebanov.selinux
[ ! -d $rolesdir/kbrebanov.dkms ] && git clone https://github.com/kbrebanov/ansible-dkms.git $rolesdir/kbrebanov.dkms
[ ! -d $rolesdir/kbrebanov.kernel_headers ] && git clone https://github.com/kbrebanov/ansible-kernel_headers.git $rolesdir/kbrebanov.kernel_headers
[ ! -d $rolesdir/kbrebanov.virtualbox ] && git clone https://github.com/kbrebanov/ansible-virtualbox.git $rolesdir/kbrebanov.virtualbox
## galaxy naming: kitchen fails to transfer symlink folder
#[ ! -e $rolesdir/juju4.iptnetflow ] && ln -s ansible-ipt-netflow $rolesdir/juju4.iptnetflow
[ ! -e $rolesdir/juju4.iptnetflow ] && cp -R $rolesdir/ansible-ipt-netflow $rolesdir/juju4.iptnetflow

## don't stop build on this script return code
true
