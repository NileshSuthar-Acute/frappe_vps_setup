sudo adduser --disabled-password --gecos "" frappeinstaller

# Password less configuration

echo "frappeinstaller ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/90-frappeinstaller-nopass > /dev/null
sudo chmod 0440 /etc/sudoers.d/90-frappeinstaller-nopass
sudo visudo -c

# SSH key-auth

sudo mkdir -p /home/frappeinstaller/.ssh
sudo cp ~/.ssh/authorized_keys /home/frappeinstaller/.ssh/
sudo chown -R frappeinstaller:frappeinstaller /home/frappeinstaller/.ssh
sudo chmod 700 /home/frappeinstaller/.ssh
sudo chmod 600 /home/frappeinstaller/.ssh/authorized_keys


echo "ssh -p 7016 frappeinstaller@10.1.3.247 'sudo -n true && echo "OK: passwordless sudo works"'"
