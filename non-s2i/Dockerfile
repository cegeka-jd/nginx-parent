FROM rhel7:latest

# Custom Nginx Parent Dockerfile
#

LABEL summary="${SUMMARY}" \
      description="${DESCRIPTION}" \
      io.k8s.description="${DESCRIPTION}" \
      io.k8s.display-name="Nginx ${NGINX_VERSION}" \
      io.openshift.expose-services="80:http" \
      name="${NAME}-${NGINX_SHORT_VER}-rhel7" \
      version="${NGINX_VERSION}"

COPY nginx.repo /etc/yum.repos.d/nginx.repo  

RUN yum update && yum install -y nginx








ENV NAME=nginx \
    NGINX_VERSION=1.14 \
    NGINX_SHORT_VER=114 \
    VERSION=0 \
    SUMMARY="Platform for running nginx $NGINX_VERSION or building nginx-based application" \
    DESCRIPTION="Nginx is a web server and a reverse proxy server for HTTP, SMTP, POP3 and IMAP\
 protocols, with a strong focus on high concurrency, performance and low memory usage. The container\
 image provides a containerized packaging of the nginx $NGINX_VERSION daemon. The image can be used\
 as a base image for other applications based on nginx $NGINX_VERSION web server. \
 Nginx server image can be extended using source-to-image tool."




EXPOSE 80


ONBUILD COPY src/ /usr/share/nginx/html/ 



#ENTRYPOINT
CMD ["nginx", "-g", "daemon off;"]