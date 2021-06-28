#!/bin/bash

# Install openssh-server based on the package manager on Linux system 
if [ ! -z $(command -v apt) ]; then sudo apt install openssh-server; fi
if [ ! -z $(command -v dnf) ]; then sudo dnf install openssh-server; fi
if [ ! -z $(command -v yum) ]; then sudo yum install openssh-server; fi
if [ ! -z $(command -v pacman) ]; then sudo pacman -S install openssh-server; fi

# Edit sshd config file 
read -p "Enter a port number: " port

# Replace port number with user input in sshd config file 
sudo sed -i "s/Port/Port $port/g" /etc/ssh/sshd_config
echo "Port number successfully changed!"

# Configure changed port in SEmanage if using Red-Hat Linux
if [ ! -z $(command -v yum) ] || [ ! -z $(command -v dnf) ]; then sudo semanage port -a -t ssh_port_t -p tcp $port

# Restart sshd service 
sudo service sshd restart 

# Prompt user of success
echo "SSH Service restarted!"
echo "SSH into your machine by using the -p flag with ssh. Example: ssh -p 128 m1@192.168.1.219"

