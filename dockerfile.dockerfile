FROM php:7.4-apache-buster

RUN set -eux; \
  if command -v a2enmod; then \
  a2enmod rewrite; \
  fi; \
  savedAptMark="$(apt-mark showmanual)"; \
  apt-get update; \
  apt-get install -y --no-install-recommends \
  libfreetype6-dev \
  libjpeg-dev \
  mariadb-server \
  mariadb-client \
  git \
  wget \
  npm \
  libpng-dev \
  libpq-dev \
  libzip-dev \
  ; \
  docker-php-ext-configure gd \
  --with-freetype \
  --with-jpeg=/usr \
  ; \
  docker-php-ext-install -j "$(nproc)" \
  gd \
  opcache \
  pdo_mysql \
  pdo_pgsql \
  zip;

RUN {   echo 'opcache.memory_consumption=128'; \
  echo 'opcache.interned_strings_buffer=8'; \
  echo 'opcache.max_accelerated_files=4000'; \
  echo 'opcache.revalidate_freq=60'; \
  echo 'opcache.fast_shutdown=1'; \
  } > /usr/local/etc/php/conf.d/opcache-recommended.ini

COPY --from=composer:1.10 /usr/bin/composer /usr/local/bin/

RUN mkdir /opt/webapp
WORKDIR /opt/webapp

RUN set -eux; \
  git clone https://github.com/guonan627/swimschool; \
  rm -rf /var/www/html; \
  ln -sf /opt/webapp/swimschool/var/www/html; \
  ln -sf /opt/webapp/swimschool/api;

RUN service mysql start && mysql -u root < /opt/webapp/sqs/sqs_api/sql/sqs.sql;

ENV PORT=80,port=80,container_port=80,request_timeout=300

EXPOSE 80
CMD /usr/sbin/apachectl start && /usr/bin/mysqld_safe
