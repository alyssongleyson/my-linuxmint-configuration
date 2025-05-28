#!/bin/bash

###################################################################
# Script Name:	my-linuxmint-configuration.sh
# Description:	My post-installation configuration of Linux Mint
# Args:		bash my-linuxmint-configuration.sh
# Author:	Álysson Gleyson da Silva
###################################################################

# Updating operating system, repositories, and flatpak software

sudo apt update && sudo apt upgrade -y
flatpak update -y

