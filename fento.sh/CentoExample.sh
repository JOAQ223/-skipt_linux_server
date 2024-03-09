# fento we need to see YUM for the configuratino 

# gpgcheck , to check to not check if the reposiroties have keys 

# yum install epel-release 
#!/bin/bash

# Define the package name as a variable
PACKAGE_NAME="your-package-name"

# CentOS version check for appropriate package manager
if [ -f /etc/centos-release ]; then
  # Extract major version
  CENTOS_VERSION=$(rpm -q --queryformat '%{VERSION}' centos-release | cut -d '.' -f 1)
  
  if [ "$CENTOS_VERSION" -ge 8 ]; then
    # CentOS 8 or later, use dnf
    PACKAGE_MANAGER="dnf"
  else
    # CentOS 7, use yum
    PACKAGE_MANAGER="yum"
  fi
else
  echo "This script is intended for CentOS."
  exit 1
fi

# Add the EPEL repository
sudo $PACKAGE_MANAGER install epel-release -y

# Optionally, enable PowerTools if you are on CentOS 8 or later, as some packages may depend on it
if [ "$PACKAGE_MANAGER" = "dnf" ]; then
  sudo dnf config-manager --set-enabled PowerTools
fi

# Update your package list (optional, for dnf it might be useful to ensure the metadata is fresh)
sudo $PACKAGE_MANAGER makecache

# Install the package
sudo $PACKAGE_MANAGER install "$PACKAGE_NAME" -y

# see the the  edit config 