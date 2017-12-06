FROM centos:centos6.8

MAINTAINER alessandro.minoccheri@studiomado.it

RUN yum install -y epel-release
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm
RUN rpm -Uvh http://repo.mysql.com/mysql-community-release-el6-5.noarch.rpm

RUN yum install -y php71w \
php71w-xml \
php71w-mbstring \
php71w-json \
php71w-gd \
php71w-mcrypt \
php71w-fpm \
php71w-pdo \
php71w-opcache \
php71w-soap \
php71w-xmlrpc \
php71w-simplexml \
php71w-curl \
php71w-mysqlnd \
php71w-pecl-imagick

EXPOSE 9000

CMD ["php-fpm", "-F"]