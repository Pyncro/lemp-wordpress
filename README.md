# lemp-wordpress


sudo apt update && sudo apt upgrade -y


sudo apt install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
systemctl status nginx



sudo apt install mariadb-server -y
sudo systemctl enable mariadb
sudo systemctl start mariadb


sudo mysql_secure_installation
sudo mysql -u root -p

CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'StrongPasswordHere';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'localhost';
FLUSH PRIVILEGES;
EXIT;



sudo apt install php-fpm php-mysql php-curl php-gd php-xml php-mbstring php-zip php-soap php-intl php-bcmath unzip -y




cd /tmp
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
sudo mv wordpress /var/www/
sudo chown -R www-data:www-data /var/www/wordpress
sudo chmod -R 755 /var/www/wordpress




