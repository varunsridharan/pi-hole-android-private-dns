#!/bin/bash
echo "========================================================="
echo "==!! Pi-Hole : Android Private DNS Configuration !!=="
echo "========================================================="
echo ""
DNS_DOMAIN_NAME="$1"
SSL_CERT_EMAIL="$2"
if [[ -z "$DNS_DOMAIN_NAME" ]]; then
    echo "Set a valid Private DNS Domain Name"
    exit 1
fi

if [[ -z "$SSL_CERT_EMAIL" ]]; then
    echo "Set a valid Email Address To Get Certificate From Let's Encrypt"
    exit 1
fi
#
# Disable Existing WebServer
#
echo "Stopping & Disabling lighttpd Server"
sudo service lighttpd stop
sudo systemctl disable lighttpd
#
# Setting Up Ubuntu To Fetch PHP7.0 Source
#
sudo apt-get -y install python-software-properties
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update
#
# Starting To Instll Nginx & PHP7.0 With its Addons
#
echo "Installing Nginx,PHP7.0"
sudo apt-get -y install nginx php7.0-fpm php7.0-zip apache2-utils php7.0-sqlite3 php7.0-mbstring
#
# Requesting User To Provide A Valid Domain Name For Android Private DNS
#
echo ""
echo "=============================="
echo "Pi-Hole Android Private DNS Domain Name"
echo "=============================="
echo ""
#
# Setup Nginx To Use Given Domain Name
#
echo "Setting Up Nginx"
sudo touch /etc/nginx/sites-available/pihole
echo "server {
            listen 80;
            listen [::]:80;
            root /var/www/html;
            server_name {dns_domain_name};
            autoindex off;
            index pihole/index.php index.php index.html index.htm;
            location / {
                    expires max;
                    try_files $uri $uri/ =404;
            }
            location ~ \.php$ {
                    include snippets/fastcgi-php.conf;
                    fastcgi_pass unix:/run/php/php7.0-fpm.sock;
            }
            location /*.js {
                    index pihole/index.js;
            }
            location /admin {
                    root /var/www/html;
                    index index.php index.html index.htm;
            }
            location ~ /\.ht {
                    deny all;
            }
    }" > /etc/nginx/sites-available/pihole
sudo sed -i 's/{dns_domain_name}/'$DNS_DOMAIN_NAME'/g' /etc/nginx/sites-available/pihole
sudo ln -s /etc/nginx/sites-available/pihole /etc/nginx/sites-enabled/pihole 
sudo nginx -t
sudo systemctl reload nginx
#
# Installing Certbot To Generate Letsenc
#
sudo add-apt-repository -y ppa:certbot/certbot
sudo apt-get install -y certbot python-certbot-nginx
echo ""
echo "=============================="
echo "Your Email To Use When Requesting Certificate in Let's Encrypt"
echo "Email : $SSL_CERT_EMAIL"
echo "Domain : $DNS_DOMAIN_NAME"
echo "=============================="
echo ""
sudo certbot --nginx -m "$SSL_CERT_EMAIL" -d "$DNS_DOMAIN_NAME" -n --agree-tos --no-eff-email
#
# Starting All Required Services
#
sudo service php7.0-fpm start
sudo service nginx start

#
# Configure Nginx To Run DNS Over TLS By Creating A Stream
#
sudo mkdir /etc/nginx/streams/
sudo touch /etc/nginx/streams/dns-over-tls
sudo echo "upstream dns-servers {
           server    127.0.0.1:53;
    }
    server {
      listen 853 ssl; # managed by Certbot
      ssl_certificate /etc/letsencrypt/live/{dns_domain_name}/fullchain.pem; # managed by Certbot
      ssl_certificate_key /etc/letsencrypt/live/{dns_domain_name}/privkey.pem; # managed by Certbot
      ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
      ssl_protocols        TLSv1.2 TLSv1.3;
      ssl_ciphers          HIGH:!aNULL:!MD5;
            
      ssl_handshake_timeout    10s;
      ssl_session_cache        shared:SSL:20m;
      ssl_session_timeout      4h;
      proxy_pass dns-servers;
    }" > /etc/nginx/streams/dns-over-tls
sudo sed -i 's/{dns_domain_name}/'$DNS_DOMAIN_NAME'/g' /etc/nginx/streams/dns-over-tls
sudo echo "
    stream {
            include /etc/nginx/streams/*;
    }
	" >> /etc/nginx/nginx.conf
sudo service nginx restart
#
# All Done Now
#
echo ""
echo ""
echo ""
echo ""
echo "======================================================================================="
echo "Congrats Pi-Hole With Android Private DNS is configured."
echo "Private DNS Domain : $DNS_DOMAIN_NAME"
echo "Now you can use the domain name in your android phone to block adds"
echo "For more information on how to configure private dns in android please check https://github.com/varunsridharan/pi-hole-android-private-dns"
echo "======================================================================================="