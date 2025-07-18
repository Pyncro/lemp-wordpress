# lemp-wordpress

```
sudo apt update && sudo apt upgrade -y


sudo apt install nginx -y
sudo systemctl enable nginx
sudo systemctl start nginx
systemctl status nginx


sudo apt install software-properties-common dirmngr -y
sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://mariadb.org/mariadb_release_signing_key.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/mariadb.gpg > /dev/null

sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] http://mirror.23media.com/mariadb/repo/11.8.2/ubuntu noble main'

echo "deb [signed-by=/etc/apt/keyrings/mariadb.gpg arch=amd64] http://mirror.23media.com/mariadb/repo/11.8.2/ubuntu noble main" | sudo tee /etc/apt/sources.list.d/mariadb.list


sudo apt update
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




```sudo nano /etc/nginx/sites-available/yourdomain.com```


server {
    listen 80;
    server_name yourdomain.com www.yourdomain.com;

    root /var/www/html;
    index index.php index.html index.htm;

    access_log /var/log/nginx/yourdomain_access.log;
    error_log /var/log/nginx/yourdomain_error.log;

    location / {
        try_files $uri $uri/ /index.php?$args;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
    }

    location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg)$ {
        expires max;
        log_not_found off;
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    location ~ /\.ht {
        deny all;
    }
}

yourdomain.com with your actual domain
/var/www/html with the correct path to your WordPress files
php7.4-fpm.sock with the correct PHP version (check with php -v)





sudo ln -s /etc/nginx/sites-available/yourdomain.com /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx
sudo apt install php-fpm
sudo systemctl restart php
sudo apt install certbot python3-certbot-nginx
sudo certbot --nginx

sudo chmod -R 755 /var/www/wordpress


```

