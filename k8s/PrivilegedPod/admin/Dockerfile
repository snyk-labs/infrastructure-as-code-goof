FROM php:7.4-cli
RUN yes '' | pecl install -f redis-5.1.1 && docker-php-ext-enable redis
COPY src /usr/src/myapp
WORKDIR /usr/src/myapp
CMD [ "php", "-S", "0.0.0.0:8080" ]
