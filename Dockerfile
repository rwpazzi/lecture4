# INFR2670: Dockerfile sample for lecture 4
FROM ubuntu:24.04

# Avoinding tzdata interactive prompt
ENV DEBIAN_FRONTEND=noninteractive

# Install Apache 
RUN apt update && \
 apt -y install apache2

# Add your own content to the deafult webpage (index.html)
RUN echo 'This is my INFR2670 webpage running in a container!' > /var/www/html/index.html

# Apache configuration
# We need to source the environment variables '. /etc/apache2/envvars'
# Then we need to create the directories 'mkdir -p /var/run/apache2' and /var/lock/apache2'  
# We want to run apache in the foreground '/usr/sbin/apache2 -D FOREGROUND' 
# Then run apache

EXPOSE 80

CMD ["/bin/bash", "-c", "mkdir -p /var/run/apache2 /var/lock/apache2 && . /etc/apache2/envvars && exec /usr/sbin/apache2 -D FOREGROUND"]
