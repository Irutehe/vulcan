# Base image
FROM php:8.3-fpm

# Define a build-time variable for the working directory
ARG WORKDIR=/var/www/vulcan
ARG APP_WORKDIR=${WORKDIR}/app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    wget \
    zip \
    unzip \
    git \
    libzip-dev \
    && docker-php-ext-install zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Symfony CLI
RUN curl -sS https://get.symfony.com/cli/installer | bash \
    && mv /root/.symfony*/bin/symfony /usr/local/bin/symfony

# Init credentials (needed by symfony, you may want to change them)
RUN git config --global user.email "b76bra@yahoo.com" && git config --global user.name "Irutehe"

# Use the variable to set the working directory
WORKDIR ${WORKDIR}

# Copy rest of the application code
COPY . .
RUN chown -R www-data:www-data .

# Set user www-data
USER www-data
