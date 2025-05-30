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

echo "Installing packages using flatpak..."
for pkg in "${flatpak_packages[@]}"; do
	flatpak install -y flathub "$pkg"
done

# Installation using wget

install_external_app() {
	local url=$1
	local deb_name=$(basename "$url")

	echo "Downloadng $deb_name..."
	wget -q "$url" -O "/tmp/$deb_name"

	echo "Installing $deb_name..."
	sudo dpkg -i "/tmp/$deb_name" || sudo apt install -f -y
	rm "/tmp/$deb_name"
}

echo "Installing external packages using .deb..."

# VS Code
install_external_app "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"

# Sublime Text
install_external_app "https://download.sublimetext.com/sublime-text_build-3211_amd64.deb"

