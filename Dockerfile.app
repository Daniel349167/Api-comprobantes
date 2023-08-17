FROM php:8.2-fpm

# Cambiar al usuario root
USER root

# Instalar dependencias y extensiones de PHP
RUN apt-get update && \
    apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev git unzip default-mysql-client && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd pdo pdo_mysql

# Establecer el directorio de trabajo
WORKDIR /var/www

# Copiar la aplicación
COPY ./ .

# Instalar las dependencias de Composer
# Instala Composer permitiendo la ejecución como superusuario
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
    echo "COMPOSER_ALLOW_SUPERUSER=1" >> /etc/environment

# Instalar las dependencias del proyecto con Composer
RUN composer install

# Copiar el script de inicio
COPY ./start.sh start.sh

# Dar permisos de ejecución al script
RUN chmod +x start.sh

# Ejecutar el script de inicio como el comando predeterminado
CMD ["./start.sh"]
