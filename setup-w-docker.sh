#!/bin/bash

#  RUN SCIIPT AS ROOT. USE sudo su - 
# sudo bash /home/code/php-switch-scripts/setup.sh

echo "PATH=\$PATH/usr/local/bin/" >> /home/code/.bashrc
echo "PATH=\$(composer global config bin-dir --absolute --quiet):\$PATH" >> /home/code/.bashrc
echo "alias ..='cd ..'" >> /home/code/.bashrc
echo "alias c='clear'" >> /home/code/.bashrc
echo "alias egrep='egrep --color=auto'" >> /home/code/.bashrc
echo "alias entry='docker run -it --entrypoint bash '" >> /home/code/.bashrc
echo "alias ex='docker exec -it'" >> /home/code/.bashrc
echo "alias fgrep='fgrep --color=auto'" >> /home/code/.bashrc
echo "alias grep='grep --color=auto'" >> /home/code/.bashrc
echo "alias l.='ls -d .* --color=auto'" >> /home/code/.bashrc
echo "alias la='exa -abghH1iS'" >> /home/code/.bashrc
echo "alias ll='ls -al --color=auto'" >> /home/code/.bashrc
echo "alias ls='ls --color=auto'" >> /home/code/.bashrc
echo "alias greset='git reset --hard origin/HEAD'" >> /home/code/.bashrc
echo "alias ps='docker ps'" >> /home/code/.bashrc
echo "alias rst='source ~/.bashrc'" >> /home/code/.bashrc
echo "alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'" >> /home/code/.bashrc
echo "alias ps='docker ps'" >> /home/code/.bashrc
echo "alias sc='sail artisan route:clear && sail artisan config:clear && sail artisan cache:clear && composer dumpauto'" >> /home/code/.bashrc
echo "alias prune='docker system prune -a'" >> /home/code/.bashrc
echo "alias cc='cd /home/code/codecorp_docker' " >> /home/code/.bashrc
echo "alias chowndata='sudo chown -R www-data:www-data ./'" >> /home/code/.bashrc
echo "alias chowncode='sudo chown -R code:code ./'" >> /home/code/.bashrc
echo "alias chownsail='sudo chown -R sail:sail ./'" >> /home/code/.bashrc
echo "alias gcompact='git gc --auto'" >> /home/code/.bashrc
echo "alias ch7='sudo chmod -R 777 /home/code/ && sudo chown -R code:code /home/code'" >> /home/code/.bashrc




echo "* Refreshing software repositories..."
sudo apt-get update #> /dev/null
sudo apt-get upgrade -y  #> /dev/null

# Install pre-requisite packages.
sudo apt-get install -y wget apt-transport-https software-properties-common curl unzip  gcc g++ make
# sudo rm -rf /var/lib/apt/lists/lock
# sudo rm -rf /var/cache/apt/pkgcache.bin
# sudo rm -rf /var/cache/apt/srcpkgcache.bin

sudo curl -fsSL https://deb.nodesource.com/setup_current.x | bash -
sudo apt install nodejs -y && corepack enable
corepack prepare yarn@stable --activate
yarn --version

# Download the Microsoft repository GPG keys
wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
# Register the Microsoft repository GPG keys
sudo dpkg -i packages-microsoft-prod.deb
# Update the list of products

source /home/code/.bashrc
# Enable the "universe" repositories
sudo add-apt-repository -y universe
# Add locate function 
sudo yum install mlocate
# add /mnt to PRUNEPATHS in /etc/updatedb.conf in order to avoid indexing Windows files.
sudo nano /etc/updatedb.conf
# sudo updatedb
# Install PowerShell
# sudo apt-get install -y powershell
# Start PowerShell



# Fix and run wsl host resolutionphp 
# common vars
wsl='/etc/wsl.conf'
resolv='/etc/resolv.conf'

# remove standard files
rm -f $wsl
rm -f $resolv

# Create custom WSL name resolution
cp ./dist/wsl.conf $wsl
echo "[boot]" >> $wsl
echo "systemd=true" >> $wsl
cp ./dist/resolv.conf $resolv

# This prevents resolv.conf from being deleted when WSL starts
chattr +i $resolv

echo 'WSL name resolution configured'
# echo 'Restart WSL on Windows: "wsl --shutdown"'


# IF GIT IS NEEDED UNCOMMENT LINES BELOW
# echo "install Git for ubuntu"
# sudo add-apt-repository ppa:git-core/ppa
# sudo apt-get update > /dev/null
# sudo apt-get install git -y  > /dev/null
# echo "install Git LFS for ubuntu"
# sudo apt-get install git-lfs -y  > /dev/null


# INSTALL SUBLIMETEXT INTO DOCKER AND UBUNTU
# echo "install Sublime for ubuntu"
# wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
# sudo apt-get install apt-transport-https
# echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
# sudo apt-get update  > /dev/null
# sudo apt-get install sublime-text -y > /dev/null
# echo "export EDITOR='subl -w'" >> /home/code/.bashrc
# source /home/code/.bashrc

# touch ~/.config/sublime-text-3/Packages/User/Package Control.sublime-settings
# ADD PROJECT DIRECTORY TO SUBL
# subl -a /home/code/codecorp_docker


# IF YOU NEED TO REMOVE MLOCATE BECAUSE FAILED INSTALL RUN
# sudo apt-get remove --auto-remove mlocate plocate
# sudo apt-get purge --auto-remove mlocate plocate



echo "* Refreshing software repositories..."
sudo apt-get update > /dev/null
sudo apt-get upgrade -y  > /dev/null

# echo "installing openssh-server"
# sudo apt-get install openssh-server > /dev/hull
# sudo systemctl enable ssh --now
# sudo ufw allow ssh
# sudo ufw enable

# https://www.cyberciti.biz/faq/ubuntu-linux-install-openssh-server/
# sudo systemctl enable ssh
# sudo systemctl start ssh
# 
# 
# Configure firewall and open port 22
# sudo ufw allow ssh
# sudo ufw enable
# sudo ufw status
# man sshd_config

echo "* Installing prerequisite software packages..."
sudo apt-get install -y software-properties-common > /dev/null

echo "* Setting up third-party repository to allow installation of multiple PHP versions..."
sudo add-apt-repository -y ppa:ondrej/php > /dev/null

echo "* Refreshing software repositories..."
sudo apt-get update > /dev/null

# echo "* Installing PHP 5.6..."
# sudo apt-get install -y php5.6 php5.6-common php5.6-cli > /dev/null

# echo "* Installing PHP 5.6 extensions..."
# sudo apt-get install -y php5.6-curl php5.6-mcrypt php5.6-soap php5.6-bz2 php5.6-gd php5.6-mysql php5.6-sqlite3 php5.6-json php5.6-opcache php5.6-xml php5.6-mbstring php5.6-readline php5.6-xmlrpc php5.6-zip php-redis > /dev/null

# echo "* Installing PHP 7.0..."
# sudo apt-get install -y php7.0 php7.0-common php7.0-cli > /dev/null

# echo "* Installing PHP 7.0 extensions..."
# sudo apt-get install -y php7.0-gd php7.0-mysql php7.0-sqlite3 php7.0-soap php7.0-xsl php7.0-json php7.0-opcache php7.0-mbstring php7.0-readline php7.0-curl php7.0-mcrypt php7.0-xml php7.0-zip php-redis > /dev/null

# echo "* Installing PHP 7.1..."
# sudo apt-get install -y php7.1 php7.1-common php7.1-cli > /dev/null

# echo "* Installing PHP 7.1 extensions..."
# sudo apt-get install -y php7.1-gd php7.1-mysql php7.1-sqlite3 php7.1-soap php7.1-xsl php7.1-json php7.1-opcache php7.1-mbstring php7.1-readline php7.1-curl php7.1-mcrypt php7.1-xml php7.1-zip php-redis > /dev/null

# echo "* Installing PHP 7.2..."
# sudo apt-get install -y php7.2 php7.2-common php7.2-cli > /dev/null

# echo "* Installing PHP 7.2 extensions..."
# sudo apt-get install -y php7.2-bz2 php7.2-curl php7.2-gd php7.2-json php7.2-mbstring php7.2-mysql php7.2-opcache php7.2-readline php7.2-soap php7.2-sqlite3 php7.2-tidy php7.2-xml php7.2-xsl php7.2-zip > /dev/null

# echo "* Installing PHP 7.3..."
# sudo apt-get install -y php7.3 php7.3-common php7.3-cli > /dev/null

# echo "* Installing PHP 7.3 extensions..."
# sudo apt-get install -y php7.3-bz2 php7.3-curl php7.3-gd php7.3-json php7.3-mbstring php7.3-mysql php7.3-opcache php7.3-readline php7.3-soap php7.3-sqlite3 php7.3-tidy php7.3-xml php7.3-xsl php7.3-zip > /dev/null

# echo "* Installing PHP 7.4..."
# sudo apt-get install -y php7.4 php7.4-common php7.4-cli > /dev/null

# echo "* Installing PHP 7.4 extensions..."
# sudo apt-get install -y php7.4-bz2 php7.4-curl php7.4-gd php7.4-json php7.4-mbstring php7.4-mysql php7.4-opcache php7.4-readline php7.4-soap php7.4-sqlite3 php7.4-tidy php7.4-xml php7.4-xsl php7.4-zip > /dev/null

echo "* Installing PHP 8.0..."
sudo apt-get install -y php8.0 php8.0-common php8.0-cli > /dev/null

echo "* Installing PHP 8.0 extensions..."
sudo  apt-get install -y --no-install-recommends libmagickwand-dev
sudo apt-get install -y php8.0-bz2 php8.0-curl php8.0-gd php8.0-mbstring php8.0-mysql php8.0-opcache php8.0-readline php8.0-soap php8.0-sqlite3 php8.0-tidy php8.0-xml php8.0-xsl php8.0-zip php8.0-imagick libapache2-mod-php8.0 > /dev/null

echo "* Installing additional PHP extensions..."
sudo apt-get install -y php-memcache php-memcached php-redis  > /dev/null

echo "* Installing PHP 8.1..."
sudo apt-get install -y php8.1 php8.1-common php8.1-cli > /dev/null

echo "* Installing PHP 8.1 extensions..."
sudo  apt-get install -y --no-install-recommends libmagickwand-dev
sudo apt-get install -y php8.1-bz2 php8.1-curl php8.1-gd php8.1-mbstring php8.1-mysql php8.1-opcache php8.1-readline php8.1-soap php8.1-sqlite3 php8.1-tidy php8.1-xml php8.1-xsl php8.1-imagick php8.1-zip libapache2-mod-php8.1  > /dev/null

echo "* Installing additional PHP extensions..."
sudo apt-get install -y php-memcache php-memcached php-redis  > /dev/null


echo "installing composer"
cd ~
# curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
wget -O composer-setup.php https://getcomposer.org/installer
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
sudo chmod +x /usr/local/bin/composer
sudo composer self-update 


# curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

echo "* Setup complete. You may now use the 'switch-to-php-*.*.sh' scripts."

# echo "Installing Rust"
# curl https://sh.rustup.rs -sSf | sh -s -- -y

# bash switch-to-php-8.1.sh


# -----------------------
# question for you.  my local docker container is running no issues.  php and all modules are installed into wsl
# problem is docker container does not have 


