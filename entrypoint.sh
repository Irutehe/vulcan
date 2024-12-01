#!/bin/bash

# move to app_old folder
cd app

# Rulează composer install fără interacțiuni
php bin/composer.phar install --no-interaction

# Pornite serverul PHP-FPM
php-fpm