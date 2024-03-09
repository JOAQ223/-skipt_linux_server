# adduser, useradd

#adduser  .. fill all the needed data from user easier 
# test  with ssh frank 
# modify user usermod -s /bin/false suzy to not led him log in 

#userdel to delete a user  example 
#!/bin/bash

# Check if the script is run as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Prompt for the username to delete
read -p "Enter the username to delete: " username

# Attempt to delete the user
userdel -r $username

if [ $? -eq 0 ]; then
    echo "User $username has been deleted successfully."
else
    echo "Failed to delete user $username. Please check if the user exists."
fi

