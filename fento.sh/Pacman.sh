#!/bin/bash

# Define the package name as a variable
PACKAGE_NAME="your-package-name"

# Check if yay is installed
if ! command -v yay &> /dev/null
then
    echo "yay could not be found, installing yay..."

    # Install necessary packages to compile packages from AUR
    sudo pacman -Sy git base-devel --needed
    # Install for example pacman -Sy vim 

    # Clone yay repository from AUR
    git clone https://aur.archlinux.org/yay.git

    # Change directory to the cloned repository
    cd yay

    # Build and install yay
    makepkg -si

    # Go back to the original directory
    cd ..
else
    echo "yay is already installed."
fi

# Use yay to install the package
yay -S "$PACKAGE_NAME"
