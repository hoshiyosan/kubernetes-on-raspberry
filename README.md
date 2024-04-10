# Raspberry PI / Kubernetes cluster

## Grant SSH access to a new key

* Generate an SSH key if required

```
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_raspberry_osadmin
```

* Copy value of SSH public key (in our example `~/.ssh/id_raspberry_osadmin.pub`) in the list of public keys located in `variables/ssh_authorized_keys.yml`.

* Run playbook to update SSH keys on all nodes

```bash
# only works from private network
make update-ssh-authorized-keys
```

**NOTE**: To run this from the Internet, [use public inventory](#use-public-inventory-when-running-ansible-playbooks)


## Access nodes from the Internet

### Add cluster hosts to your `~/.ssh/config`

```
Host k3s-master
   HostName sylvan.ovh
   User osadmin
   Port 2220

Host k3s-worker1
   HostName sylvan.ovh
   User osadmin
   Port 2221

Host k3s-worker2
   HostName sylvan.ovh
   User osadmin
   Port 2222
```

### Use public inventory when running ansible playbooks

```bash
export ANSIBLE_INVENTORY="inventory/public.yml"
```

**NOTE**: this is required to avoid using nodes' private IP addresses.