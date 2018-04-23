FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update

#RUN apt-get -y dist-upgrade
#RUN apt-get install -y -f build-essential
#RUN apt-get -f -y install libcurl3-gnutls python-pycurl python-software-properties
RUN apt-get -y install software-properties-common
RUN apt-get -y install language-pack-en

RUN LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
RUN apt-get update && apt-get -y install \
	apache2 php5.6-common php5.6-cli \
	php-pear php5.6-bcmath php5.6-gd \
	php5.6-gmp php5.6-imap php5.6-intl \
	php5.6-ldap php5.6-mbstring php5.6-pspell \
	php5.6-snmp php5.6-xml php5.6-xmlrpc \
	php5.6-soap php5.6-fpm libapache2-mod-php5.6 \
	php5.6-mysql php5.6-json php5.6-mcrypt \
	php-memcache memcached php5.6

#RUN a2enmod php
RUN a2enmod rewrite

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

RUN chown -R www-data:www-data /var/www/
RUN chown -R www-data:adm /var/log/apache2
RUN chmod -R a+w /var/log/apache2

# Instalo o SEI
RUN mkdir -p /opt
RUN mkdir -p /opt/dados
ADD v3.0.10_BaseRef/v3.0.0/SEI-Fontes-v3.0.0/ /opt
RUN chown -R www-data:www-data /opt/*

# Adiciono includes
COPY sei.conf /etc/apache2
RUN echo "IncludeOptional sei.conf" >> /etc/apache2/apache2.conf
RUN echo "include_path = \".:/opt/infra/infra_php/:/opt/infra/:/opt/infra:/usr/lib:/usr/share/php\"" >> /etc/php/5.6/apache2/php.ini
RUN echo "short_open_tag = On" >> /etc/php/5.6/apache2/php.ini

# Starto apache
ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

EXPOSE 80
# CMD ["entrypoint.sh"]

