# Use an official PHP runtime as a parent image
FROM php:7.4-apache

# Set the working directory in the container
WORKDIR /var/www/html

# Install additional dependencies and PHP extensions
RUN apt-get update && \
    apt-get install -y libmariadb-dev-compat libmariadb-dev && \
    docker-php-ext-install mysqli

# Copy the application code to the container
COPY . .

# Expose a port (if necessary)
EXPOSE 80

# The CMD instruction specifies the command to run on container startup
CMD ["apache2-foreground"]
