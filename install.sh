#!/bin/bash

function ln-cfg {
  [[ -e "$2" ]] && mv -i "$2" "$2.bak"
  ln -s "$(pwd)/$1" "$2"
}


cd $(dirname $(readlink -f $0)) # jump to the script directory


# fstab
# leaving this out for now, as fstab is extremely device specific.
# ln-cfg fstab /etc/fstab

# pacman.conf
ln-cfg pacman.conf /etc/pacman.conf


# swap.conf must be placed after the installation of systemd-swap
# ln-cfg swap.conf /etc/systemd/swap.conf