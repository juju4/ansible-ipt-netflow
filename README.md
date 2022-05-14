# IPT Netflow kernel module ansible role

Ansible role to setup IPT Netflow
https://github.com/aabc/ipt-netflow

High performance NetFlow v5, v9, IPFIX flow data export module for Linux
   kernel. Created to be useful for highly loaded linux router. It should be
   used as iptables target.

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 1.9
 * 2.0
 * 2.2
 * 2.5

### Operating systems

Ubuntu 14.04, 16.04, 18.04 and Centos7

## Example Playbook

Just include this role in your list.
For example

```
- host: all
  roles:
    - juju4.ipt-netflow
```

## Variables

Nothing specific for now.

## Continuous integration

This role has a travis basic test (for github), more advanced with kitchen and also a Vagrantfile (test/vagrant).
Default kitchen config (.kitchen.yml) is lxd-based, while (.kitchen.vagrant.yml) is vagrant/virtualbox based.

Once you ensured all necessary roles are present, You can test with:
```
$ gem install kitchen-ansible kitchen-lxd_cli kitchen-sync kitchen-vagrant
$ cd /path/to/roles/juju4.ipt-netflow
$ KITCHEN_YAML=".kitchen.vagrant.yml" kitchen verify
```
or
```
$ cd /path/to/roles/juju4.ipt-netflow/test/vagrant
$ vagrant up
$ vagrant ssh
```

## Troubleshooting & Known issues

* kitchen/lxd is commented out as we are building kernel modules which require alignments of headers/running kernel.
Use kitchen/vagrant

* need to add support for dkms

## License

BSD 2-clause
