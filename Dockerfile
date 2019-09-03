FROM jenkinsxio/builder-nodejs:0.1.114

RUN yum install epel-release yum-utils -y
RUN yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum-config-manager --enable remi-php72
RUN yum install php php-common php-opcache php-mcrypt php-cli php-gd php-curl php-mysql -y

RUN curl -sS https://getcomposer.org/installer | php  
RUN mv composer.phar /usr/local/bin/composer  