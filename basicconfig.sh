sudo apt-get update && apt-get full-upgrade -y
#cifs-utils wird installiert, damit man auf Azure Files, bzw. den Storageaccount zugreifen kann
sudo apt install htop curl git ufw fail2ban cifs-utils -y 
sudo timedatectl set-timezone Europe/Berlin
sudo groupadd _ssh
sudo bash -c "echo -e 'LoginGraceTime 2m' >> /etc/ssh/sshd_config"
sudo bash -c "echo -e 'PermitRootLogin no' >> /etc/ssh/sshd_config"
sudo bash -c "echo -e 'StrictModes yes' >> /etc/ssh/sshd_config"
sudo bash -c "echo -e 'MaxAuthTries 4' >> /etc/ssh/sshd_config"
sudo bash -c "echo -e 'MaxSessions 10' >> /etc/ssh/sshd_config"
sudo bash -c "echo -e 'Port 4444' >> /etc/ssh/sshd_config"
sudo bash -c "echo -e 'Protocol 2' >> /etc/ssh/sshd_config"
sudo bash -c "echo -e 'AllowGroups _ssh' >> /etc/ssh/sshd_config"
sudo bash -c "echo -e 'PermitEmptyPasswords no' >> /etc/ssh/sshd_config"
sudo usermod -aG _ssh panicoverload
sudo systemctl restart ssh
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 4444
sudo ufw enable
cd ~
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh --dry-run
sudo sh get-docker.sh
sudo gpasswd -a panicoverload docker
sudo service docker restart  
