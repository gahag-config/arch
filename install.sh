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

# sudoers must be placed after the installation of sudo.
ln-cfg sudoers /etc/sudoers

# nvidia.conf must be placed after the installation of xorg.
ln-cfg 20-nvidia.conf /etc/X11/xorg.conf.d/20-nvidia.conf

# exports must be placed after the installation of nfs-utils.
ln-cfg exports /etc/exports
