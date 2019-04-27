FROM centos:7
ENV ver 1.12.2
RUN yum update -y && yum install -y httpd unzip zip wget moreutils epel-release
RUn yum install -y https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
COPY mariadb.repo /etc/yum.repos.d/
RUN yum makecache && yum install -y php70w php70w-bcmath php70w-cli php70w-common php70w-gd php70w-ldap php70w-mbstring php70w-mcrypt php70w-mysqlnd php70w-opcache php70w-pdo php70w-pecl-imagick php70w-pecl-memcached php70w-pgsql php70w-soap php70w-xml MariaDB-client
COPY i-doit.ini /etc/php.d/i-doit.ini
COPY i-doit.conf /etc/httpd/conf.d/i-doit.conf
COPY httpd-foreground /usr/bin/httpd-foreground
RUN wget https://sourceforge.net/projects/i-doit/files/i-doit/${ver}/idoit-open-${ver}.zip/download -O /tmp/i-doit.zip
COPY run.sh /run.sh

CMD ["/run.sh"]
