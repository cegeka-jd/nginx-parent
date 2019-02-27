FROM rhel7:7.3

MAINTAINER Red Hat Training <training@redhat.com>

# Generic labels
LABEL Component="nginx" \
      Name="do288/nginx-parent" \
      Version="1.0" \
      Release="1"

# Labels consumed by OpenShift
LABEL io.k8s.description="A basic Nginx Server image with ONBUILD instructions" \
      io.k8s.display-name="Nginx Server parent image" \
      io.openshift.expose-services="80:http" \
      io.openshift.tags="nginx"

ADD nginx.repo /etc/yum.repos.d/nginx.repo

RUN yum install -y nginx && \
    yum clean all -y && \
    sed -i 's/\/var\/www\/html/\/usr\/share\/nginx\/html' /etc/nginx/sites-enabled && \
    echo "Hello from the nginx-parent container!" > /usr/share/nginx/html/index.html

# Describe Nginx
ENV NAME=nginx \
    NGINX_VERSION=1.14 \
    NGINX_SHORT_VER=114 \
    VERSION=0 \
    SUMMARY="Platform for running nginx $NGINX_VERSION or building nginx-based application"
    
 ENV DESCRIPTION="Nginx is a web server and a reverse proxy server for HTTP, SMTP, POP3 and IMAP\
 protocols, with a strong focus on high concurrency, performance and low memory usage. The container\
 image provides a containerized packaging of the nginx $NGINX_VERSION daemon. The image can be used\
 as a base image for other applications based on nginx $NGINX_VERSION web server. \
 Nginx server image can be extended using source-to-image tool."

#nginx runs on port 80
EXPOSE 80

# Allows child images to inject their own content into DocumentRoot
ONBUILD COPY src/ /usr/share/nginx/html/ 

# Start Nginx
#
#ENTRYPOINT
CMD ["nginx", "-g", "daemon off;"]