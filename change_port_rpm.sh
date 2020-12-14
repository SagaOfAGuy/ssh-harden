# Install SSH on Red-Hat Based system
sudo dnf install openssh-server 

# Edit sshd config file 
read -p "Enter a port number: " port

# Replace port number with user input in sshd config file 
sudo sed -i "s/Port 524/Port $port/g" /etc/ssh/sshd_config
echo "Port number successfully changed!"

# Restart sshd service 
sudo service sshd restart 

# Prompt user of success
echo "SSH Service restarted!"

echo "SSH into your machine by using the -p flag with ssh. Example: ssh -p 128 m1@192.168.1.219"
