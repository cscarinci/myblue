#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

mkdir -p /nix

echo -n "max_parallel_downloads=10" >>/etc/dnf/dnf.conf

dnf5 install -y emacs

dnf5 install -y zathura zathura-plugins-all

dnf5 -y copr enable pgdev/ghostty
dnf5 install -y ghostty
dnf5 -y copr disable pgdev/ghostty

dnf5 -y swap fedora-logos aurora-logos
dnf5 -y remove aurora-plymouth

dnf5 autoremove -y
dnf5 clean all -y
