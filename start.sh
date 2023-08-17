#!/bin/sh

# Espera hasta que MySQL esté listo
while ! mysqladmin ping -h"db" -u"daniel" -p"123" --silent; do
    echo "Esperando a que la base de datos esté disponible..."
    sleep 1
done

# Verificar si las migraciones ya han sido ejecutadas
if ! php artisan migrate:status | grep -q 'N  <none>'; then
    echo "Las migraciones ya han sido ejecutadas."
else
    # Ejecuta las migraciones
    php artisan migrate --seed
fi

# Inicia php-fpm
php-fpm
