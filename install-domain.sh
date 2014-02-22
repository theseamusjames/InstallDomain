#!/bin/bash

echo "Enter the domain to install" 
read domain 
echo "Installing $domain..." 
echo "Creating vhost..." 
sudo cp /etc/apache2/sites-available/template /etc/apache2/sites-available/$domain

echo "Configuring vhost..." 
sudo sed -i "s/{{domain}}/$domain/g" /etc/apache2/sites-available/$domain

echo "Creating directory..." 
mkdir /var/www/$domain 

echo "Creating symlink..." 
sudo ln -s /etc/apache2/sites-available/$domain /etc/apache2/sites-enabled/$domain 

echo "Restarting apache..." 
sudo service apache2 restart 

cd /var/www/$domain
touch index.html

echo "Complete"