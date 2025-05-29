#!/bin/bash

###################################################################
# Script Name:	my-linuxmint-configuration.sh
# Description:	My post-installation configuration of Linux Mint
# Args:		bash my-linuxmint-configuration.sh
# Author:	Álysson Gleyson da Silva
###################################################################

# Stop script on error
set -e

# Updating operating system, repositories, and flatpak software

sudo apt update && sudo apt upgrade -y
flatpak update -y

# Installation using APT

apt_packages=(
	git
	rar
	unrar
	vim
	virtualbox
	terminator
	wine
	cheese
	flameshot
	steam
	synapse
	php
	copyq
	vlc
)

echo "Installing packages using apt..."
sudo apt install -y "${apt_packages[@]}"

# Installation using Flatpak

flatpak_packages=(
	md.obsidian.Obsidian
	com.brave.Browser
	com.bitwarden.desktop
	com.jetbrains.PyCharm-Community
)

