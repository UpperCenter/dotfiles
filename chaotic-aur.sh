#!/bin/bash

# Set the log file
LOG_FILE="/var/log/chaotic-aur-install.log"

# Function to log messages
log() {
    echo "$(date) - $1" | tee -a $LOG_FILE
}

# Function to handle errors
handle_error() {
    log "ERROR: $1"
    exit 1
}

# Install the primary key
log "Installing the primary key..."
pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com || handle_error "Failed to receive the primary key"
pacman-key --lsign-key FBA220DFC880C036 || handle_error "Failed to locally sign the primary key"
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' || handle_error "Failed to install the keyring and mirrorlist"

# Append the Chaotic AUR repository to the pacman.conf file
log "Appending the Chaotic AUR repository to the pacman.conf file..."
echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" >>/etc/pacman.conf || handle_error "Failed to append the Chaotic AUR repository to the pacman.conf file"

# Update the package database
log "Updating the package database..."
pacman -Sy || handle_error "Failed to update the package database"

log "Chaotic AUR successfully installed!"
