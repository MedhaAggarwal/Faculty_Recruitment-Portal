# Use the official PHP image as a parent image
FROM php:7.4-apache

# Set environment variables
ENV APACHE_DOCUMENT_ROOT /var/www/html/public

# Set the working directory in the container
WORKDIR /var/www/html

# Install required PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable Apache modules
RUN a2enmod rewrite

# Copy the application code to the working directory
COPY . .

# Expose port 80
EXPOSE 80

# Command to run the Apache server
CMD ["apache2-foreground"]
