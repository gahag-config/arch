#!/bin/bash

function ln-cfg {
  if [[ -e "$2" ]]; then
    echo "[Warning] Backing up $2..."
    mv -i "$2" "$2.bak"
  fi
  
  ln -s "$(pwd)/$1" "$2"
}


cd $(dirname $(readlink -f $0)) # jump to the script directory


# pacman.conf
ln-cfg pacman.conf /etc/pacman.conf

# swap.conf must be placed after the installation of systemd-swap.
ln-cfg swap.conf /etc/systemd/swap.conf

# Network manager dns settings
ln-cfg 10-dns.conf /etc/NetworkManager/conf.d/10-dns.conf
ln-cfg resolv.conf /etc/resolv.conf


# sudoers must be placed after the installation of sudo.
# ln-cfg sudoers /etc/sudoers # This won't work because the sudores file must be owned by root.

# exports must be placed after the installation of nfs-utils.
# ln-cfg exports /etc/exports

