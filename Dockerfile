FROM centos:latest
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum install -y httpd

RUN echo 'Welcome to the automated CICD Pipeline' > /var/www/html/index.html

CMD ["/usr/sbin/httpd", "-D",  "FOREGROUND"]
