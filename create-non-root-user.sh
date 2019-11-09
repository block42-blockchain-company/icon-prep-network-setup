sudo mkdir -p /home/$USER/.ssh
sudo touch /home/$USER/.ssh/authorized_keys
sudo useradd -d /home/$USER $USER
sudo usermod -aG sudo $USER
sudo chown -R $USER:$USER /home/$USER/
sudo chmod 700 /home/$USER/.ssh
sudo chmod 644 /home/$USER/.ssh/authorized_keys
