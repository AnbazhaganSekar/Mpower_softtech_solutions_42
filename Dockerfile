# Use the official httpd image as the base image
FROM httpd:latest
# Copy your custom Apache configuration file (if needed)
# COPY ./my-httpd.conf /usr/local/apache2/conf/httpd.conf
# Optionally, copy your website files to the document root
# COPY ./my-website /usr/local/apache2/htdocs/
# Expose port 80 to the outside world
EXPOSE 80
# Define an environment variable (if needed)
# ENV MY_ENV_VAR=value
# Start the Apache HTTP Server
CMD ["httpd-foreground"]
