# Use the official Ubuntu image as a base
FROM ubuntu:20.04

# Set environment variables to prevent interactive prompts during installation
ENV DEBIAN_FRONTEND=noninteractive

# Install Apache and clean up unnecessary files in one layer
RUN apt-get update && \
    apt-get install -y --no-install-recommends apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy the index.html file to the web server root
COPY index.html /var/www/html/index.html

# Expose port 80 for the web server
EXPOSE 80

# Start Apache in the foreground
CMD ["apachectl", "-D", "FOREGROUND"]
