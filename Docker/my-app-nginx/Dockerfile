
# Use the official NGINX image as a base
FROM nginx:latest

# Copy the index.html file to the web server root
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 for the web server
EXPOSE 80

# Start NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]
