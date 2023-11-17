#!/bin/sh
#
# Entrypoint used to configure environment based
# on variables passed into the Docker container.
#

PHP_FPM_POOL_CONFIG="/etc/php81/php-fpm.d/www.conf"

# Configure PHP-FPM pool child processes
sed -i "s/PHP_MAX_CHILDREN-REPLACE/${PHP_MAX_CHILDREN:-5}/" ${PHP_FPM_POOL_CONFIG}
sed -i "s/PHP_START_SERVERS-REPLACE/${PHP_START_SERVERS:-2}/" ${PHP_FPM_POOL_CONFIG}
sed -i "s/PHP_MIN_SPARE_SERVERS-REPLACE/${PHP_MIN_SPARE_SERVERS:-1}/" ${PHP_FPM_POOL_CONFIG}
sed -i "s/PHP_MAX_SPARE_SERVERS-REPLACE/${PHP_MAX_SPARE_SERVERS:-3}/" ${PHP_FPM_POOL_CONFIG}

exec "$@"
