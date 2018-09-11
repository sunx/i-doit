#!/bin/sh
DIR=/var/www/html/i-doit

if [[ ! -d ${DIR}/admin ]]; then
    mkdir /var/www/html/i-doit;
    cp /tmp/i-doit.zip /var/www/html/i-doit/;
    cd /var/www/html/i-doit/ && unzip i-doit.zip;
    chown apache:apache -R .;
    find . -type d -name \* -exec chmod 775 {} \;
    find . -type f -exec chmod 664 {} \;
    chmod 774 controller *.sh setup/*.sh
fi
httpd-foreground
