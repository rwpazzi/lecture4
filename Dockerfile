FROM ubuntu:20.04

# Avoinding tzdata interactive prompt
ENV DEBIAN_FRONTEND=noninteractive

# Install Apache 
RUN apt-get update && \
 apt-get -y install apache2

# Add your own content to the deafult webpage (index.html)
RUN echo 'This is my INFR2670 webpage running in a container!' > /var/www/html/index.html

# Apache configuration
RUN echo '. /etc/apache2/envvars' > /root/run_apache.sh && \
 echo 'mkdir -p /var/run/apache2' >> /root/run_apache.sh && \
 echo 'mkdir -p /var/lock/apache2' >> /root/run_apache.sh && \ 
 echo '/usr/sbin/apache2 -D FOREGROUND' >> /root/run_apache.sh && \ 
 chmod 755 /root/run_apache.sh

EXPOSE 80

CMD /root/run_apache.sh
