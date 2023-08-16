# Ansible Void Install Script


## Prepare live iso

1. Boot into live cd
2. Install dependencies

```Bash

xbps-install -Sy xtools python3 curl

```

3. Install your ssh key
```Bash

mkdir -p $HOME/.ssh
curl https//github.com/username.keys > $HOME/.ssh/authorized_keys
```
4. Update hosts.ini with your ip address or set to localhost if running directly off live cd

### So far implemented

- Partition disk with the bios, esp, and root partition (luks1)
- Create subvolumes (can be addjusted through group_vars)
- Prompts for installation options (hostname, installation disk, passphrases for root, and luks)
- snapshots with snapperd
- bootstrap with chroot

