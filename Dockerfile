FROM centos:centos6

MAINTAINER alessandro.minoccheri@studiomado.it

RUN yum -y update
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

RUN sed -e 's/127.0.0.1:9000/0.0.0.0:9000/' \
        -e '/allowed_clients/d' \
        -e '/catch_workers_output/s/^;//' \
        -e '/error_log/d' \
        -i /etc/php-fpm.d/www.conf

EXPOSE 9000

CMD ["php-fpm", "-F"]